class PaketSoalList {
  int? status;
  String? message;
  List<PaketSoalData>? data;

  PaketSoalList({this.status, this.message, this.data});

  PaketSoalList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PaketSoalData>[];
      json['data'].forEach((v) {
        data!.add(new PaketSoalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaketSoalData {
  String? exerciseId;
  String? exerciseTitle;
  String? accessType;
  String? icon;
  String? exerciseUserStatus;
  String? jumlahSoal;
  int? jumlahDone;

  PaketSoalData(
      {this.exerciseId,
      this.exerciseTitle,
      this.accessType,
      this.icon,
      this.exerciseUserStatus,
      this.jumlahSoal,
      this.jumlahDone});

  PaketSoalData.fromJson(Map<String, dynamic> json) {
    exerciseId = json['exercise_id'];
    exerciseTitle = json['exercise_title'];
    accessType = json['access_type'];
    icon = json['icon'];
    exerciseUserStatus = json['exercise_user_status'];
    jumlahSoal = json['jumlah_soal'];
    jumlahDone = json['jumlah_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exercise_id'] = this.exerciseId;
    data['exercise_title'] = this.exerciseTitle;
    data['access_type'] = this.accessType;
    data['icon'] = this.icon;
    data['exercise_user_status'] = this.exerciseUserStatus;
    data['jumlah_soal'] = this.jumlahSoal;
    data['jumlah_done'] = this.jumlahDone;
    return data;
  }
}