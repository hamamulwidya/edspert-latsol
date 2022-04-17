import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';
import 'package:git_project/models/kerjakan_latihan_soal.dart';
import 'package:git_project/models/materi.dart';
import 'package:git_project/models/paket_soal.dart';
import 'package:git_project/models/sub_materi.dart';
import 'package:git_project/view/main/latihan_soal/kerjakan_latihan_soal_page.dart';

import '../../../repository/latihan_soal_api.dart';

class PakeSoalPage extends StatefulWidget {
  const PakeSoalPage({Key? key, required this.id}) : super(key: key);
  static String route = "paket_soal_page";
  final String id;
  @override
  State<PakeSoalPage> createState() => _PakeSoalPageState();
}

class _PakeSoalPageState extends State<PakeSoalPage> {
  PaketSoal? paketSoal;

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
      final idMateri = subMateri!.data![0].subCourseContentId;
      await getPaketSoal(idMateri);
      setState(() {});
    }
  }

  getPaketSoal(id) async {
    final response =
        await LatihanSoalApi().getPaketSoal("alitopan@widyaedu.com", id);
    print(response);
    if (response != null) {
      paketSoal = PaketSoal.fromJson(response);
      // final idMateri = materi!.data!.listCourseContent![0].courseContentId;
      // await getSubMateri(idMateri);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMateri(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.grey,
      appBar: AppBar(
        title: Text("Paket Soal"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pilih Paket Soal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            paketSoal == null
                ? Container()
                : Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 3,
                      children: List.generate(
                        paketSoal!.data!.length,
                        (index) => PaketSoalWidget(
                          title: paketSoal!.data![index].exerciseTitle!,
                          id: paketSoal!.data![index].exerciseId!,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class PaketSoalWidget extends StatelessWidget {
  const PaketSoalWidget({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => KerjakanLatihanSoalPage(
            id: id,
          ),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        // margin: const EdgeInsets.all(13.0),
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.withOpacity(0.2)),
              padding: EdgeInsets.all(12),
              child: Image.asset(
                R.assets.icNote,
                width: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "0/0 Paket Soal",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                  color: R.colors.greySubtitleHome),
            ),
          ],
        ),
      ),
    );
  }
}
