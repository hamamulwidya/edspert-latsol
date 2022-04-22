class UserByEmail {
  int? status;
  String? message;
  UserData? data;

  UserByEmail({this.status, this.message, this.data});

  UserByEmail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  String? iduser;
  String? userName;
  String? userEmail;
  String? userFoto;
  String? userAsalSekolah;
  String? dateCreate;
  String? jenjang;
  String? userGender;
  String? userStatus;

  UserData(
      {this.iduser,
      this.userName,
      this.userEmail,
      this.userFoto,
      this.userAsalSekolah,
      this.dateCreate,
      this.jenjang,
      this.userGender,
      this.userStatus});

  UserData.fromJson(Map<String, dynamic> json) {
    iduser = json['iduser'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userFoto = json['user_foto'];
    userAsalSekolah = json['user_asal_sekolah'];
    dateCreate = json['date_create'];
    jenjang = json['jenjang'];
    userGender = json['user_gender'];
    userStatus = json['user_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iduser'] = this.iduser;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_foto'] = this.userFoto;
    data['user_asal_sekolah'] = this.userAsalSekolah;
    data['date_create'] = this.dateCreate;
    data['jenjang'] = this.jenjang;
    data['user_gender'] = this.userGender;
    data['user_status'] = this.userStatus;
    return data;
  }
}