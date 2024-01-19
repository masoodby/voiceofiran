import 'package:dio/dio.dart';

class ApiProvider {
  final dio = Dio();
  Stream getCategories() async* {
    try {
      final response =
          await dio.get('https://voice-of-iran-republic.com/api/programs');

      final myapi = response.data;
      yield myapi;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getPrograms(programId) async {
    try {
      final response = await dio.get(
          'https://voice-of-iran-republic.com/api/programs/${programId["code"]}');

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getDetail(url) async {
    try {
      
      final response = await dio.get('$url');
      // print("api.dart response ${response.data}");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
  Stream homeApi() async* {
    try {
      final response =
          await dio.get('https://voice-of-iran-republic.com/api/home');

      final myapi = response.data;
      yield myapi;
    } catch (e) {
      rethrow;
    }
  }

}
