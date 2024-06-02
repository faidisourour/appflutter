import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  static const String baseUrl = 'http://192.168.1.18:8080/api/auth';

  Future<Map<String, dynamic>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String photo,
  }) async {
    final url = Uri.parse('$baseUrl/signup');
    final response = await http.post(
      url,
      body: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
        'photo': photo,
      },
    );

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    return json.decode(response.body);
  }
}
