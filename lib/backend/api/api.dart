import 'package:dio/dio.dart';
import 'dart:convert';

class ApiProvider {
  final dio = Dio();
  Stream getCategories() async* {
    try {
      final response = await dio.get(
        'https://voice-of-iran-republic.com/api/programs',
      );
      // print("response => $response");
      final myapi = Stream.fromIterable(response.data.map((e) => [e]));

      print("api.dart : $myapi");
      // List<Map<String, dynamic>> apidata = response.data;

      yield myapi;
    } catch (e) {
      rethrow;
    }
  }
}
