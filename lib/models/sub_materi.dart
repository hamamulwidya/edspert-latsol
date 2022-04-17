class SubMateri {
  int? status;
  String? message;
  List<Data>? data;

  SubMateri({this.status, this.message, this.data});

  SubMateri.fromJson(Map<String, dynamic> json) {
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
  String? courseContentId;
  String? subCourseContentId;
  String? majorName;
  String? courseCategory;
  String? courseName;
  String? courseContentName;
  String? subCourseContentName;
  int? jumlahPaket;
  int? jumlahDone;
  int? progress;

  Data(
      {this.courseId,
      this.courseContentId,
      this.subCourseContentId,
      this.majorName,
      this.courseCategory,
      this.courseName,
      this.courseContentName,
      this.subCourseContentName,
      this.jumlahPaket,
      this.jumlahDone,
      this.progress});

  Data.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseContentId = json['course_content_id'];
    subCourseContentId = json['sub_course_content_id'];
    majorName = json['major_name'];
    courseCategory = json['course_category'];
    courseName = json['course_name'];
    courseContentName = json['course_content_name'];
    subCourseContentName = json['sub_course_content_name'];
    jumlahPaket = json['jumlah_paket'];
    jumlahDone = json['jumlah_done'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['course_content_id'] = this.courseContentId;
    data['sub_course_content_id'] = this.subCourseContentId;
    data['major_name'] = this.majorName;
    data['course_category'] = this.courseCategory;
    data['course_name'] = this.courseName;
    data['course_content_name'] = this.courseContentName;
    data['sub_course_content_name'] = this.subCourseContentName;
    data['jumlah_paket'] = this.jumlahPaket;
    data['jumlah_done'] = this.jumlahDone;
    data['progress'] = this.progress;
    return data;
  }
}