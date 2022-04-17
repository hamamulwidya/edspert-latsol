class Materi {
  int? status;
  String? message;
  Data? data;

  Materi({this.status, this.message, this.data});

  Materi.fromJson(Map<String, dynamic> json) {
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
  int? totalSoal;
  int? totalSoalDone;
  int? totalSubMateri;
  List<ListCourseContent>? listCourseContent;

  Data(
      {this.totalSoal,
      this.totalSoalDone,
      this.totalSubMateri,
      this.listCourseContent});

  Data.fromJson(Map<String, dynamic> json) {
    totalSoal = json['total_soal'];
    totalSoalDone = json['total_soal_done'];
    totalSubMateri = json['total_sub_materi'];
    if (json['list_course_content'] != null) {
      listCourseContent = <ListCourseContent>[];
      json['list_course_content'].forEach((v) {
        listCourseContent!.add(new ListCourseContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_soal'] = this.totalSoal;
    data['total_soal_done'] = this.totalSoalDone;
    data['total_sub_materi'] = this.totalSubMateri;
    if (this.listCourseContent != null) {
      data['list_course_content'] =
          this.listCourseContent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListCourseContent {
  String? courseId;
  String? courseContentId;
  String? majorName;
  String? courseCategory;
  String? courseName;
  String? courseContentName;
  int? jumlahSubmateri;
  int? jumlahDone;
  int? progress;

  ListCourseContent(
      {this.courseId,
      this.courseContentId,
      this.majorName,
      this.courseCategory,
      this.courseName,
      this.courseContentName,
      this.jumlahSubmateri,
      this.jumlahDone,
      this.progress});

  ListCourseContent.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseContentId = json['course_content_id'];
    majorName = json['major_name'];
    courseCategory = json['course_category'];
    courseName = json['course_name'];
    courseContentName = json['course_content_name'];
    jumlahSubmateri = json['jumlah_submateri'];
    jumlahDone = json['jumlah_done'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['course_content_id'] = this.courseContentId;
    data['major_name'] = this.majorName;
    data['course_category'] = this.courseCategory;
    data['course_name'] = this.courseName;
    data['course_content_name'] = this.courseContentName;
    data['jumlah_submateri'] = this.jumlahSubmateri;
    data['jumlah_done'] = this.jumlahDone;
    data['progress'] = this.progress;
    return data;
  }
}