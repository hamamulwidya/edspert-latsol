import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';
import 'package:git_project/models/paket_soal.dart';

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
    getPaketSoal(widget.id);
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
                            (index) => PaketSoalWodget(
                                  title: paketSoal!.data![index].exerciseTitle!,
                                ))),
                  ),
          ],
        ),
      ),
    );
  }
}

class PaketSoalWodget extends StatelessWidget {
  const PaketSoalWodget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
