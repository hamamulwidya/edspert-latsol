import 'package:flutter/material.dart';
import 'package:git_project/models/mata_pelajaran_list.dart';
import 'package:git_project/view/main/latihan_soal/home_page.dart';
import 'package:git_project/view/main/latihan_soal/materi_page.dart';
import 'package:git_project/view/main/latihan_soal/paket_soal_page.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({Key? key, required this.mapel}) : super(key: key);
  static String route = "mapel_page";
  final MataPelajaranList mapel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Mata Pelajaran"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20,
        ),
        child: ListView.builder(
            itemCount: mapel.data!.length,
            itemBuilder: (context, index) {
              final currentMapel = mapel.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PakeSoalPage(id: currentMapel.courseId!),
                  ));
                },
                child: MapelWidget(
                  title: currentMapel.courseName!,
                  count: currentMapel.jumlahDone.toString(),
                  total: currentMapel.jumlahDone.toString(),
                ),
              );
            }),
      ),
    );
  }
}
