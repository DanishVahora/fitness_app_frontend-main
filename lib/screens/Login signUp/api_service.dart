import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:8000'; // Change to your server URL if needed

  Future<Map<String, dynamic>> registerUser(String email, String password, int age, String gender, int weight, int height, String goal, String activity) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'age': age,
        'gender': gender,
        'weight': weight,
        'height': height,
        'goal': goal,
        'activity': activity,
      }),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return jsonDecode(response.body);
  }
}
