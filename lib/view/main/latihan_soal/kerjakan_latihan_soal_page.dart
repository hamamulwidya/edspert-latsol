import 'package:flutter/material.dart';
import 'package:git_project/models/kerjakan_soal_list.dart';
import 'package:git_project/models/network_response.dart';
import 'package:git_project/repository/latihan_soal_api.dart';

class KerjakanLatihanSoalPage extends StatefulWidget {
  const KerjakanLatihanSoalPage({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<KerjakanLatihanSoalPage> createState() =>
      _KerjakanLatihanSoalPageState();
}

class _KerjakanLatihanSoalPageState extends State<KerjakanLatihanSoalPage> {
  KerjakanSoalList? soalList;
  getQuestionList() async {
    final result = await LatihanSoalApi().postQuestionList(widget.id);
    if (result.status == Status.success) {
      soalList = KerjakanSoalList.fromJson(result.data!);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latihan Soal")),
      // tombol selanjutnya atau submit
      bottomNavigationBar: Container(),
      body: soalList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                // TabBar no soal
                Container(),
                // TabBarView soal dan pilihan jawaban
                Expanded(child: Container())
              ],
            ),
    );
  }
}
