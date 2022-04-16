import 'package:flutter/material.dart';
import 'package:git_project/constants/r.dart';

class PakeSoalPage extends StatefulWidget {
  const PakeSoalPage({Key? key}) : super(key: key);
  static String route = "paket_soal_page";
  @override
  State<PakeSoalPage> createState() => _PakeSoalPageState();
}

class _PakeSoalPageState extends State<PakeSoalPage> {
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
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 3/2,
                children: [
                  PaketSoalWodget(),
                  PaketSoalWodget(),
                  PaketSoalWodget(),
                  PaketSoalWodget()
                ],
              ),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
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
            "Aljabar",
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
