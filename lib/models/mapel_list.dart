class MapelList {
  int? status;
  String? message;
  List<Data>? data;

  MapelList({this.status, this.message, this.data});

  MapelList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? courseId;
  String? majorName;
  String? courseCategory;
  String? courseName;
  String? urlCover;
  int? jumlahMateri;
  int? jumlahDone;
  int? progress;

  Data(
      {this.courseId,
      this.majorName,
      this.courseCategory,
      this.courseName,
      this.urlCover,
      this.jumlahMateri,
      this.jumlahDone,
      this.progress});

  Data.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    majorName = json['major_name'];
    courseCategory = json['course_category'];
    courseName = json['course_name'];
    urlCover = json['url_cover'];
    jumlahMateri = json['jumlah_materi'];
    jumlahDone = json['jumlah_done'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['major_name'] = this.majorName;
    data['course_category'] = this.courseCategory;
    data['course_name'] = this.courseName;
    data['url_cover'] = this.urlCover;
    data['jumlah_materi'] = this.jumlahMateri;
    data['jumlah_done'] = this.jumlahDone;
    data['progress'] = this.progress;
    return data;
  }
}