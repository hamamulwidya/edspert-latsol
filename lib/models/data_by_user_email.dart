class DataUserByEmail {
  int? status;
  String? message;
  Data? data;

  DataUserByEmail({this.status, this.message, this.data});

  DataUserByEmail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? iduser;
  String? userName;
  String? userEmail;
  String? userWhatsapp;
  String? userFoto;
  String? userPropinsi;
  String? userKabupaten;
  String? sosmed;
  String? userPropSekolah;
  String? userKabSekolah;
  String? userAsalSekolah;
  String? kelas;
  String? uniqcode;
  String? referral;
  String? dateCreate;
  String? jenjang;
  String? userGender;
  String? userPropinsiId;
  String? userPropSekolahId;
  String? userKabSekolahId;
  String? userToken;
  String? verifiedPhone;
  String? userStatus;
  String? appleId;

  Data(
      {this.iduser,
      this.userName,
      this.userEmail,
      this.userWhatsapp,
      this.userFoto,
      this.userPropinsi,
      this.userKabupaten,
      this.sosmed,
      this.userPropSekolah,
      this.userKabSekolah,
      this.userAsalSekolah,
      this.kelas,
      this.uniqcode,
      this.referral,
      this.dateCreate,
      this.jenjang,
      this.userGender,
      this.userPropinsiId,
      this.userPropSekolahId,
      this.userKabSekolahId,
      this.userToken,
      this.verifiedPhone,
      this.userStatus,
      this.appleId});

  Data.fromJson(Map<String, dynamic> json) {
    iduser = json['iduser'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userWhatsapp = json['user_whatsapp'];
    userFoto = json['user_foto'];
    userPropinsi = json['user_propinsi'];
    userKabupaten = json['user_kabupaten'];
    sosmed = json['sosmed'];
    userPropSekolah = json['user_prop_sekolah'];
    userKabSekolah = json['user_kab_sekolah'];
    userAsalSekolah = json['user_asal_sekolah'];
    kelas = json['kelas'];
    uniqcode = json['uniqcode'];
    referral = json['referral'];
    dateCreate = json['date_create'];
    jenjang = json['jenjang'];
    userGender = json['user_gender'];
    userPropinsiId = json['user_propinsi_id'];
    userPropSekolahId = json['user_prop_sekolah_id'];
    userKabSekolahId = json['user_kab_sekolah_id'];
    userToken = json['user_token'];
    verifiedPhone = json['verified_phone'];
    userStatus = json['user_status'];
    appleId = json['apple_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iduser'] = this.iduser;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_whatsapp'] = this.userWhatsapp;
    data['user_foto'] = this.userFoto;
    data['user_propinsi'] = this.userPropinsi;
    data['user_kabupaten'] = this.userKabupaten;
    data['sosmed'] = this.sosmed;
    data['user_prop_sekolah'] = this.userPropSekolah;
    data['user_kab_sekolah'] = this.userKabSekolah;
    data['user_asal_sekolah'] = this.userAsalSekolah;
    data['kelas'] = this.kelas;
    data['uniqcode'] = this.uniqcode;
    data['referral'] = this.referral;
    data['date_create'] = this.dateCreate;
    data['jenjang'] = this.jenjang;
    data['user_gender'] = this.userGender;
    data['user_propinsi_id'] = this.userPropinsiId;
    data['user_prop_sekolah_id'] = this.userPropSekolahId;
    data['user_kab_sekolah_id'] = this.userKabSekolahId;
    data['user_token'] = this.userToken;
    data['verified_phone'] = this.verifiedPhone;
    data['user_status'] = this.userStatus;
    data['apple_id'] = this.appleId;
    return data;
  }
}