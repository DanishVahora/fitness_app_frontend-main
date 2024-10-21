import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  String _email = '';
  String _gender = '';
  int _age = 0;
  int _height = 0;
  String _weight = '';
  String _activityLevel = '';
  String _goal = '';
  String _currentUserId = '';

  String get email => _email;
  String get gender => _gender;
  int get age => _age;
  int get height => _height;
  String get weight => _weight;
  String get activityLevel => _activityLevel;
  String get goal => _goal;
  String get currentUserId => _currentUserId;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();  // Notify listeners of the change
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();  // Notify listeners of the change
  }

  void setHeight(int height) {
    _height = height; // Assuming you have a _height field
    notifyListeners(); // Notify listeners about the change
  }

  void setWeight(String weight) {
    _weight = weight; // Ensure _weight is a String type or adjust accordingly
    notifyListeners(); // Notify listeners to update any UI that depends on this data
  }

  void setActivityLevel(String activityLevel) {
    _activityLevel = activityLevel;
    notifyListeners();  // Notify listeners of the change
  }

  void setGoal(String goal) {
    _goal = goal;
    notifyListeners();  // Notify listeners of the change
  }

  void setCurrentUserId(String userId) {
    _currentUserId = userId;
    notifyListeners();
  }

  Future<void> updateUserDetailsInDB() async {
    String userId = 'current_user_id'; // Replace with actual user ID retrieval logic
    String url = 'https://yourapi.com/users/$userId'; // Replace with your API endpoint

    // Create a payload with user details
    Map<String, dynamic> payload = {
      'gender': _gender,
      'age': _age,
      'height': _height,
      'weight': _weight,
      'activityLevel': _activityLevel,
      'goal': _goal,
    };

    try {
      // Make the API request to update user details
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          // Add any other headers required (like authentication)
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        // Successfully updated in the database
        print('User details updated successfully.');
      } else {
        // Handle error response
        print('Failed to update user details: ${response.body}');
      }
    } catch (error) {
      // Handle any network or other errors
      print('Error updating user details: $error');
    }
  }
}
