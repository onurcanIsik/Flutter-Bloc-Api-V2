// ignore_for_file: avoid_print, unused_local_variable, unnecessary_nullable_for_final_variable_declarations

import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:sample_bloc_api/core/model/user_model.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response?> getData() async {
    try {
      final Response? response =
          await _dio.get("https://jsonplaceholder.typicode.com/posts");
      return response;
    } catch (e) {
      print(e);
    }
  }
}

class ApiRepo {
  ApiRepo(this._apiService);
  final ApiService _apiService;

  Future<List<User>?> getUserList() async {
    final response = await _apiService.getData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((singlePost) => User.fromJson(singlePost)).toList();
    }
  }
}
