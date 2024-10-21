import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
// Base URL for your backend
  final String _baseUrl = 'http://192.168.0.195:8000';  // Ensure the IP and port are correct

// Login function
  // Example of a loginUser method in AuthProvider
  // Login function
  Future<bool> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      // Log the response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          print('Login successful: ${response.body}');
          return true; // Login successful
        } else {
          print('Login failed: ${data['message']}');
          return false; // Login failed
        }
      } else {
        print('Login error: ${response.body}');
        return false; // Handle non-200 response
      }
    } catch (error) {
      print('Error logging in: $error');
      return false; // Catch and handle error
    }
  }






// Signup function
  Future<String?> signupUser(String name, String email, String password) async {

    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.195:8000/register'),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      // Log the status code and response body for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Check if the response is successful based on the status code
      if (response.statusCode == 201) {  // Change to 201 for successful registration
        final data = jsonDecode(response.body);

        // Check the 'status' field in the response
        if (data['status'] == 'success') {
          // Return 'success' or a token if needed
          return 'success';  // Adjust to return data['token'] if your backend sends a token
        } else {
          // Handle case where status is not 'success'
          print('Signup failed: ${data['message']}');
          return null;
        }
      } else {
        // Log if the response code is not 201
        print('Signup error: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Error signing up: $error');
      return null;
    }
  }




}