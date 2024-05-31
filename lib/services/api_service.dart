import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  late http.Client httpClient;

  ApiService(this.baseUrl) {
    httpClient = http.Client();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/auth/login');
    final response = await httpClient.post(
      url,
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> signup(
      String firstName, String lastName, String email, String password) async {
    final url = Uri.parse('$baseUrl/api/auth/signup');
    final response = await httpClient.post(
      url,
      body: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
