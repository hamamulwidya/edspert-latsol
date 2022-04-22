import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_project/models/kerjakan_latihan_soal.dart';
import 'package:git_project/models/simple_response.dart';
import 'package:git_project/repository/latihan_soal_api.dart';
import 'package:git_project/view/main/latihan_soal/result_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class KerjakanLatihanSoalPage extends StatefulWidget {
  const KerjakanLatihanSoalPage({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<KerjakanLatihanSoalPage> createState() =>
      _KerjakanLatihanSoalPageState();
}

class _KerjakanLatihanSoalPageState extends State<KerjakanLatihanSoalPage>
    with SingleTickerProviderStateMixin {
  KerjakanLatihanSoal? soal;
  getSoalLatihan(id) async {
    final response =
        await LatihanSoalApi().postMulaiKerjakan("alitopan@widyaedu.com", id);
    print(response);
    if (response != null) {
      soal = KerjakanLatihanSoal.fromJson(response);
      _controller = TabController(
        length: soal!.data!.length,
        vsync: this,
      );
      _controller.addListener(() {
        // if (!_controller.indexIsChanging) {
        //   if (_controller.index == soal!.data!.length - 1)
        // }
        setState(() {});
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSoalLatihan(widget.id);
  }

  bool isLoading = false;
  late TabController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan Soal"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          child: soal == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    TabBar(
                      controller: _controller,
                      tabs: List.generate(
                        soal!.data!.length,
                        (index) => Text(
                          "${index + 1}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _controller,
                        children: List.generate(
                          soal!.data!.length,
                          (index) => SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  "Soal no ${index + 1}",
                                  style: TextStyle(color: Colors.black),
                                ),
                                if (soal!.data![index].questionTitle != null)
                                  Text(
                                    "${soal!.data![index].questionTitle}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                if (soal!.data![index].questionTitleImg != null)
                                  Image.network(
                                    soal!.data![index].questionTitleImg!,
                                    errorBuilder: (context, _, s) {
                                      return Container();
                                    },
                                  ),
                                _buildPilihanJawaban(
                                  "A",
                                  soal!.data![index].optionA,
                                  soal!.data![index].optionAImg,
                                  index,
                                  soal!.data![index].studentAnswer,
                                ),
                                _buildPilihanJawaban(
                                  "B",
                                  soal!.data![index].optionB,
                                  soal!.data![index].optionBImg,
                                  index,
                                  soal!.data![index].studentAnswer,
                                ),
                                _buildPilihanJawaban(
                                  "C",
                                  soal!.data![index].optionC,
                                  soal!.data![index].optionCImg,
                                  index,
                                  soal!.data![index].studentAnswer,
                                ),
                                _buildPilihanJawaban(
                                  "D",
                                  soal!.data![index].optionD,
                                  soal!.data![index].optionDImg,
                                  index,
                                  soal!.data![index].studentAnswer,
                                ),
                                _buildPilihanJawaban(
                                  "E",
                                  soal!.data![index].optionE,
                                  soal!.data![index].optionEImg,
                                  index,
                                  soal!.data![index].studentAnswer,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (soal!.data!.length - 1 == _controller.index) {
                                isLoading = true;
                                setState(() {});
                                // Payload
                                final firebaseEmail =
                                    FirebaseAuth.instance.currentUser!.email;
                                String email = "alitopan@widyaedu.com";
                                String exerciseId = widget.id;
                                List<String> answer = [];
                                List<String> idSoal = [];

                                soal!.data!.forEach((element) {
                                  answer.add(element.studentAnswer ?? "X");
                                  idSoal.add(element.bankQuestionId!);
                                });

                                final payload = {
                                  "user_email": email,
                                  "exercise_id": exerciseId,
                                  "student_answer": answer,
                                  "bank_question_id": idSoal
                                };

                                print(payload);

                                final result = await LatihanSoalApi()
                                    .postInputJawaban(payload);
                                if (result != null) {
                                  final data = SimpleREsponse.fromJson(result);
                                  if (data.status == 1) {
                                    isLoading = false;
                                    setState(() {});
                                    Navigator.of(context).pop();
                                    // Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ResultPage()));
                                  }
                                }
                              } else {

                              _controller.animateTo(_controller.index + 1);
                              }

                            },
                            child: Text(
                                soal!.data!.length - 1 == _controller.index
                                    ? "Kumpulin"
                                    : "Selanjutnya"))),
                  ],
                ),
        ),
      ),
    );
  }

  Container _buildPilihanJawaban(option, answerText, img, index, userAnswer) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: option == userAnswer ? Colors.blue : Colors.white,
          ),
          onPressed: () {
            soal!.data![index].studentAnswer = option;
            setState(() {});
          },
          child: Builder(builder: (context) {
            if (img != null) return Image.network("${img}");
            return Text("$option. ${answerText}",
                style: TextStyle(
                  color: !(option == userAnswer) ? Colors.blue : Colors.white,
                ));
          })),
    );
  }
}
