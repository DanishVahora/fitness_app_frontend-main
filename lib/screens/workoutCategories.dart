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
        appBar: AppBar(
          title: const Text("Workout Categories"),
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to HomepageNavbar
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: AppPadding.horizontalPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Text
                const Text(
                  "Choose Your Workout Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                // Loop through workoutPlan and display the workout for each day
                for (var day in workoutPlan)
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                day['image'] ?? 'assets/workout/default_workout.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  day['title'] ?? 'Workout',
                                  style: const TextStyle(
                                    fontSize: 20,
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
                          ),
                        ],
                      )

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
          {"title": "Day 01 - Cardio", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/cardio.jpg'},
          {"title": "Day 02 - HIIT", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/HIIT.png'},
          {"title": "Day 03 - Strength Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/strength.jpg'},
          {"title": "Day 04 - Yoga", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/yoga.jpg'},
          {"title": "Day 05 - Cycling", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/cycling.jpg'},
          {"title": "Day 06 - Core Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/core.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/workout/rest.jpg'},
        ];
        break;
      case "Gain Weight":
        workoutPlan = [
          {"title": "Day 01 - Weightlifting", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/weightLifting.png'},
          {"title": "Day 02 - Upper Body", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/upper.png'},
          {"title": "Day 03 - Lower Body", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/lower.png'},
          {"title": "Day 04 - Core and Abs", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/core.png'},
          {"title": "Day 05 - Full Body", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/full_body.png'},
          {"title": "Day 06 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/stretching.png'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/workout/rest.png'},
        ];
        break;
      case "Stay Fit":
        workoutPlan = [
          {"title": "Day 01 - Pilates", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/full_body.png'},
          {"title": "Day 02 - Functional Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/functional.png'},
          {"title": "Day 03 - Bodyweight Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/bodyweight.png'},
          {"title": "Day 04 - Yoga", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/yoga.jpg'},
          {"title": "Day 05 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/stretching.jpg'},
          {"title": "Day 06 - Mobility", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/mobility.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/workout/rest.jpg'},
        ];
        break;
      case "Build Muscle":
        workoutPlan = [
          {"title": "Day 01 - Weightlifting", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/weightlifting.jpg'},
          {"title": "Day 02 - Upper Body Strength", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/upper_body.jpg'},
          {"title": "Day 03 - Lower Body Strength", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/lower_body.jpg'},
          {"title": "Day 04 - Core Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/core.jpg'},
          {"title": "Day 05 - Full Body Workout", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/full_body.jpg'},
          {"title": "Day 06 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/stretching.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/workout/rest.jpg'},
        ];
        break;
      case "Improve Endurance":
        workoutPlan = [
          {"title": "Day 01 - Cardio Session", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/cardio.jpg'},
          {"title": "Day 02 - Long-Distance Running", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/running.jpg'},
          {"title": "Day 03 - Cycling", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/cycling.jpg'},
          {"title": "Day 04 - Swimming", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/swimming.jpg'},
          {"title": "Day 05 - HIIT", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/HIIT.jpg'},
          {"title": "Day 06 - Strength Training", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/strength.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/workout/rest.jpg'},
        ];
        break;
      case "Stay Healthy":
        workoutPlan = [
          {"title": "Day 01 - Yoga", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/yoga.jpg'},
          {"title": "Day 02 - Walking", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/walking.jpg'},
          {"title": "Day 03 - Healthy Cooking", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/cooking.jpg'},
          {"title": "Day 04 - Cycling", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/cycling.jpg'},
          {"title": "Day 05 - Pilates", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/pilates.jpg'},
          {"title": "Day 06 - Stretching", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/stretching.jpg'},
          {"title": "Day 07 - Rest Day", "time": "All day", "image": 'assets/workout/rest.jpg'},
        ];
        break;
      default:
        workoutPlan = [
          {"title": "Day 01 - Default Workout", "time": "9:00 AM - 10:00 AM", "image": 'assets/workout/default_workout.png'},
        ];
        break;
    }

    return workoutPlan;
  }
}
