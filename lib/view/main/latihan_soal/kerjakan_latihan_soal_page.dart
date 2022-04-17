import 'package:flutter/material.dart';
import 'package:git_project/models/kerjakan_latihan_soal.dart';
import 'package:git_project/repository/latihan_soal_api.dart';

class KerjakanLatihanSoalPage extends StatefulWidget {
  const KerjakanLatihanSoalPage({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<KerjakanLatihanSoalPage> createState() =>
      _KerjakanLatihanSoalPageState();
}

class _KerjakanLatihanSoalPageState extends State<KerjakanLatihanSoalPage> {
  KerjakanLatihanSoal? soal;
  getSoalLatihan(id) async {
    final response =
        await LatihanSoalApi().postMulaiKerjakan("alitopan@widyaedu.com", id);
    print(response);
    if (response != null) {
      soal = KerjakanLatihanSoal.fromJson(response);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSoalLatihan(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Soal"),
      ),
      body: Container(
          child: Column(
        children: [],
      )),
    );
  }
}
