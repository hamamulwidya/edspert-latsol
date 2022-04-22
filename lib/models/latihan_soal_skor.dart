class LatihanSoalSkor {
  int? status;
  String? message;
  Data? data;

  LatihanSoalSkor({this.status, this.message, this.data});

  LatihanSoalSkor.fromJson(Map<String, dynamic> json) {
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
  Exercise? exercise;
  Result? result;

  Data({this.exercise, this.result});

  Data.fromJson(Map<String, dynamic> json) {
    exercise = json['exercise'] != null
        ? new Exercise.fromJson(json['exercise'])
        : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exercise != null) {
      data['exercise'] = this.exercise!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Exercise {
  String? exerciseId;
  String? exerciseCode;
  String? fileCourse;
  String? icon;
  String? exerciseTitle;
  String? exerciseDescription;
  String? exerciseInstruction;
  String? countQuestion;
  String? classFk;
  String? courseFk;
  String? courseContentFk;
  String? subCourseContentFk;
  String? creatorId;
  String? creatorName;
  String? examFrom;
  String? accessType;
  String? exerciseOrder;
  String? exerciseStatus;
  String? dateCreate;
  String? dateUpdate;

  Exercise(
      {this.exerciseId,
      this.exerciseCode,
      this.fileCourse,
      this.icon,
      this.exerciseTitle,
      this.exerciseDescription,
      this.exerciseInstruction,
      this.countQuestion,
      this.classFk,
      this.courseFk,
      this.courseContentFk,
      this.subCourseContentFk,
      this.creatorId,
      this.creatorName,
      this.examFrom,
      this.accessType,
      this.exerciseOrder,
      this.exerciseStatus,
      this.dateCreate,
      this.dateUpdate});

  Exercise.fromJson(Map<String, dynamic> json) {
    exerciseId = json['exercise_id'];
    exerciseCode = json['exercise_code'];
    fileCourse = json['file_course'];
    icon = json['icon'];
    exerciseTitle = json['exercise_title'];
    exerciseDescription = json['exercise_description'];
    exerciseInstruction = json['exercise_instruction'];
    countQuestion = json['count_question'];
    classFk = json['class_fk'];
    courseFk = json['course_fk'];
    courseContentFk = json['course_content_fk'];
    subCourseContentFk = json['sub_course_content_fk'];
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    examFrom = json['exam_from'];
    accessType = json['access_type'];
    exerciseOrder = json['exercise_order'];
    exerciseStatus = json['exercise_status'];
    dateCreate = json['date_create'];
    dateUpdate = json['date_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exercise_id'] = this.exerciseId;
    data['exercise_code'] = this.exerciseCode;
    data['file_course'] = this.fileCourse;
    data['icon'] = this.icon;
    data['exercise_title'] = this.exerciseTitle;
    data['exercise_description'] = this.exerciseDescription;
    data['exercise_instruction'] = this.exerciseInstruction;
    data['count_question'] = this.countQuestion;
    data['class_fk'] = this.classFk;
    data['course_fk'] = this.courseFk;
    data['course_content_fk'] = this.courseContentFk;
    data['sub_course_content_fk'] = this.subCourseContentFk;
    data['creator_id'] = this.creatorId;
    data['creator_name'] = this.creatorName;
    data['exam_from'] = this.examFrom;
    data['access_type'] = this.accessType;
    data['exercise_order'] = this.exerciseOrder;
    data['exercise_status'] = this.exerciseStatus;
    data['date_create'] = this.dateCreate;
    data['date_update'] = this.dateUpdate;
    return data;
  }
}

class Result {
  String? jumlahBenar;
  String? jumlahSalah;
  String? jumlahTidak;
  String? jumlahScore;

  Result(
      {this.jumlahBenar, this.jumlahSalah, this.jumlahTidak, this.jumlahScore});

  Result.fromJson(Map<String, dynamic> json) {
    jumlahBenar = json['jumlah_benar'];
    jumlahSalah = json['jumlah_salah'];
    jumlahTidak = json['jumlah_tidak'];
    jumlahScore = json['jumlah_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jumlah_benar'] = this.jumlahBenar;
    data['jumlah_salah'] = this.jumlahSalah;
    data['jumlah_tidak'] = this.jumlahTidak;
    data['jumlah_score'] = this.jumlahScore;
    return data;
  }
}