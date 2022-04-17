import 'package:dio/dio.dart';
import 'package:git_project/constants/api_url.dart';

class LatihanSoalApi {
  Dio apiNormal() {
    BaseOptions dioOption = BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        responseType: ResponseType.json,
        headers: {"x-api-key": "18be70c0-4e4d-44ff-a475-50c51ece99a0"});
    Dio dio = Dio(dioOption);
    return dio;
  }

  _getRequest({required String endpoint, param}) async {
    try {
      final dio = apiNormal();
      final res = await dio.get(endpoint, queryParameters: param);
      return res.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print("timeout");
      }
    } catch (e) {
      print("error");
    }
  }

  _postRequest({required String endpoint, body}) async {
    try {
      final dio = apiNormal();
      final res = await dio.post(endpoint, data: body);
      return res.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print("timeout");
      }
    } catch (e) {
      print("error");
    }
  }

  Future<Map<String, dynamic>?> getMataPelajara(email, major) async {
    final result = await _getRequest(
      endpoint: ApiUrl.latihanMataPelajaran,
      param: {
        "major_name": major,
        "user_email": email,
      },
    );
    return result;
  }

  Future<Map<String, dynamic>?> getBanner([limit]) async {
    final result = await _getRequest(
      endpoint: ApiUrl.banner,
      param: {"limit": limit},
    );
    return result;
  }

  Future<Map<String, dynamic>?> getMateri(email, materi) async {
    final result = await _getRequest(
      endpoint: ApiUrl.latihanMateri,
      param: {
        "course_id": materi,
        "user_email": email,
      },
    );
    return result;
  }

  Future<Map<String, dynamic>?> getSubMateri(email, courseContentId) async {
    final result = await _getRequest(endpoint: ApiUrl.latihanSubMateri, param: {
      "course_content_id": courseContentId,
      "user_email": email,
    });
    return result;
  }

  Future<Map<String, dynamic>?> getPaketSoal(email,subCourseContentId) async {
    final result = await _getRequest(endpoint: ApiUrl.latihanPaketSoal, param: {
      "sub_course_content_id": subCourseContentId,
      "user_email": email,
    });
    return result;
  }

  Future<Map<String, dynamic>?> getSkor(email) async {
    final result = await _getRequest(
        endpoint: ApiUrl.latihanScore, param: {"email": email});
    return result;
  }

  Future<Map<String, dynamic>?> postMulaiKerjakan(email, exercise_id) async {
    final result = await _postRequest(
      endpoint: ApiUrl.latihanKerjakan,
      body: {
      "exercise_id": exercise_id,
      "user_email": email,
    }
    );
    return result;
  }

  Future<Map<String, dynamic>?> postInputJawaban(email) async {
    final result = await _postRequest(
      endpoint: ApiUrl.latihanSubmit,
    );
    return result;
  }
}
