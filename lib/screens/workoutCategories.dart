import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/user_provider.dart';
import '../constants/padding_margin.dart';
import '../constants/color.dart';

class WorkoutCategories extends StatefulWidget {
  const WorkoutCategories({super.key});

  @override
  State<WorkoutCategories> createState() => _WorkoutCategoriesState();
}

class _WorkoutCategoriesState extends State<WorkoutCategories> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    final String goal = userProvider.goal;
    final int age = userProvider.age;
    final double height = userProvider.height.toDouble();
    final double weight = double.parse(userProvider.weight);
    final String gender = userProvider.gender;
    final String activityLevel = userProvider.activityLevel;

    // Fetch screen size
    final Size size = MediaQuery.of(context).size;

    // Generate workout plan based on user details
    List<Map<String, String>> workoutPlan =
    _generateWorkoutPlan(goal, age, height, weight, gender, activityLevel);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: AppPadding.horizontalPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Workout Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                // Loop through workoutPlan and display the workout for each day
                for (var day in workoutPlan)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: size.width * 0.9,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Workout Image Placeholder
                          Image.asset(
                            day['image'] ?? 'assets/workout/default_workout.png',
                            width: size.width * 0.3,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: size.width * 0.05),

                          // Workout Title and Time
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                day['title'] ?? 'Workout',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                day['time'] ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Generate dynamic workout plan based on user details
  List<Map<String, String>> _generateWorkoutPlan(
      String goal, int age, double height, double weight, String gender, String activityLevel) {
    List<Map<String, String>> workoutPlan = [];

    // Sample workout plans based on user goal
    switch (goal) {
      case "Lose Weight":
        workoutPlan = [
          {"title": "Day 01 - Cardio", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/hiit.png'},
          {"title": "Day 02 - HIIT", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/hiit.png'},
          {"title": "Day 03 - Strength Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/strength.jpg'},
          {"title": "Day 04 - Yoga", "time": "9:00 AM - 10:00 AM", "image": 'assets/yoga.jpg'},
          {"title": "Day 05 - Cycling", "time": "9:00 AM - 10:00 AM", "image": 'assets/cycling.jpg'},
          {"title": "Day 06 - Core Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/core.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/rest.jpg'},
        ];
        break;
      case "Gain Weight":
        workoutPlan = [
          {"title": "Day 01 - Weightlifting", "time": "9:00 AM - 10:00 AM", "image": 'assets/weightlifting.jpg'},
          {"title": "Day 02 - Upper Body Strength", "time": "9:00 AM - 10:00 AM", "image": 'assets/upper_body.jpg'},
          {"title": "Day 03 - Lower Body Strength", "time": "9:00 AM - 10:00 AM", "image": 'assets/lower_body.jpg'},
          {"title": "Day 04 - Core and Abs", "time": "9:00 AM - 10:00 AM", "image": 'assets/core_abs.jpg'},
          {"title": "Day 05 - Full Body", "time": "9:00 AM - 10:00 AM", "image": 'assets/full_body.jpg'},
          {"title": "Day 06 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/stretching.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/rest.jpg'},
        ];
        break;
      case "Stay Fit":
        workoutPlan = [
          {"title": "Day 01 - Pilates", "time": "9:00 AM - 10:00 AM", "image": 'assets/pilates.jpg'},
          {"title": "Day 02 - Functional Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/functional.jpg'},
          {"title": "Day 03 - Bodyweight Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/bodyweight.jpg'},
          {"title": "Day 04 - Yoga", "time": "9:00 AM - 10:00 AM", "image": 'assets/yoga.jpg'},
          {"title": "Day 05 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/stretching.jpg'},
          {"title": "Day 06 - Mobility", "time": "9:00 AM - 10:00 AM", "image": 'assets/mobility.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/rest.jpg'},
        ];
        break;
      case "Build Muscle":
        workoutPlan = [
          {"title": "Day 01 - Weightlifting", "time": "9:00 AM - 10:00 AM", "image": 'assets/weightlifting.jpg'},
          {"title": "Day 02 - Upper Body Strength", "time": "9:00 AM - 10:00 AM", "image": 'assets/upper_body.jpg'},
          {"title": "Day 03 - Lower Body Strength", "time": "9:00 AM - 10:00 AM", "image": 'assets/lower_body.jpg'},
          {"title": "Day 04 - Core Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/core.jpg'},
          {"title": "Day 05 - Full Body Workout", "time": "9:00 AM - 10:00 AM", "image": 'assets/full_body.jpg'},
          {"title": "Day 06 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/stretching.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/rest.jpg'},
        ];
        break;
      case "Improve Endurance":
        workoutPlan = [
          {"title": "Day 01 - Running", "time": "9:00 AM - 10:00 AM", "image": 'assets/running.jpg'},
          {"title": "Day 02 - Cycling", "time": "9:00 AM - 10:00 AM", "image": 'assets/cycling.jpg'},
          {"title": "Day 03 - Rowing", "time": "9:00 AM - 10:00 AM", "image": 'assets/rowing.jpg'},
          {"title": "Day 04 - HIIT", "time": "9:00 AM - 10:00 AM", "image": 'assets/hiit.jpg'},
          {"title": "Day 05 - Swimming", "time": "9:00 AM - 10:00 AM", "image": 'assets/swimming.jpg'},
          {"title": "Day 06 - Yoga", "time": "9:00 AM - 10:00 AM", "image": 'assets/yoga.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/rest.jpg'},
        ];
        break;
      case "Stay Healthy":
        workoutPlan = [
          {"title": "Day 01 - Walking", "time": "9:00 AM - 10:00 AM", "image": 'assets/walking.jpg'},
          {"title": "Day 02 - Yoga", "time": "9:00 AM - 10:00 AM", "image": 'assets/yoga.jpg'},
          {"title": "Day 03 - Light Cardio", "time": "9:00 AM - 10:00 AM", "image": 'assets/cardio.jpg'},
          {"title": "Day 04 - Pilates", "time": "9:00 AM - 10:00 AM", "image": 'assets/pilates.jpg'},
          {"title": "Day 05 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/stretching.jpg'},
          {"title": "Day 06 - Mobility", "time": "9:00 AM - 10:00 AM", "image": 'assets/mobility.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/rest.jpg'},
        ];
        break;
      default:
        workoutPlan = [];
    }

    return workoutPlan;
  }
}
