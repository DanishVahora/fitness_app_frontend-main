// user.dart
class User {
  String id;
  String gender;
  int age;
  double height;
  double weight;
  String activityLevel;

  User({
    required this.id,
    this.gender = '',
    this.age = 0,
    this.height = 0.0,
    this.weight = 0.0,
    this.activityLevel = '',
  });
}
