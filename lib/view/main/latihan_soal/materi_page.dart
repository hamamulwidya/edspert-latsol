import 'package:flutter/material.dart';
import 'package:git_project/models/mata_pelajaran_list.dart';
import 'package:git_project/models/materi.dart';
import 'package:git_project/models/paket_soal.dart';
import 'package:git_project/models/sub_materi.dart';
import 'package:git_project/repository/latihan_soal_api.dart';
import 'package:git_project/view/main/latihan_soal/home_page.dart';
import 'package:git_project/view/main/latihan_soal/paket_soal_page.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({Key? key, required this.id}) : super(key: key);
  static String route = "mapel_page";
  final String id;

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  bool notFound = false;

  Materi? materi;

  getMateri(id) async {
    final response =
        await LatihanSoalApi().getMateri("alitopan@widyaedu.com", id);
    print(response);
    if (response != null) {
      materi = Materi.fromJson(response);
      final idMateri = materi!.data!.listCourseContent![0].courseContentId;
      await getSubMateri(idMateri);
      // setState(() {});
    }
  }

  SubMateri? subMateri;

  getSubMateri(id) async {
    final response =
        await LatihanSoalApi().getSubMateri("alitopan@widyaedu.com", id);
    print(response);
    if (response != null) {
      subMateri = SubMateri.fromJson(response);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    getMateri(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Materi"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20,
        ),
        child: subMateri == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: subMateri!.data!.length,
                itemBuilder: (context, index) {
                  final currentMapel = subMateri!.data![index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PakeSoalPage(
                            id: currentMapel.subCourseContentId!,
                          ),
                        ));
                      },
                      child: MapelWidget(
                        title: currentMapel.courseContentName!,
                        count: currentMapel.jumlahDone.toString(),
                        total: currentMapel.jumlahDone.toString(),
                      ));
                }),
      ),
    );
  }
}
