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

  Future getPrograms(programId) async {
    // print("api.response = $programId");
    try {
      final response = await dio.get(
          'https://voice-of-iran-republic.com/api/programs/${programId["code"]}');

      // final myapi = response;
      // print("api.dart ${response.data["episodes"]}");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
