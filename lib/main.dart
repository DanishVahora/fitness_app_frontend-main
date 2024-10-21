import 'package:fitness_app_live/screens/GoalScreen/GoalScreen.dart';
import 'package:fitness_app_live/screens/Login%20signUp/LoginSignup.dart';
import 'package:fitness_app_live/screens/Login%20signUp/forgotPassword.dart';
import 'package:fitness_app_live/screens/OnBoardingScreen/onBoardingScreen.dart';
import 'package:fitness_app_live/screens/ProfilePage/profilePage.dart';
import 'package:fitness_app_live/screens/activityLevelScreen/activityLevelScreen.dart';
import 'package:fitness_app_live/screens/homeScreen/Notifications.dart';
import 'package:fitness_app_live/screens/homeScreen/bottomNavigationbar.dart';
import 'package:fitness_app_live/screens/homeScreen/homeScreen.dart';
import 'package:fitness_app_live/screens/weightScreen/WeightScreen.dart';
import 'package:fitness_app_live/screens/workoutCategories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/auth_provider.dart';
import 'Provider/user_provider.dart'; // Import the UserProvider
import 'screens/ProfilePage/PrivacyPolicy.dart';
import 'screens/ProfilePage/SettingsPage.dart';
import 'screens/ageScreen/ageScreen.dart';
import 'screens/genderScreen/genderScreen.dart';
import 'screens/heightScreen/heightScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>( // Add UserProvider here
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      routes: {
        '/onboarding': (context) => const OnBoardingScreen(),
        '/gender': (context) => const GenderPage(),
        '/age': (context) => const AgePage(),
        '/height': (context) => const HeightPage(),
        '/weight': (context) => const WeightPage(),
        '/activity': (context) => const ActivityLevelPage(),
        '/goal': (context) => const GoalPage(),
        '/forgotPassword': (context) => const ForgotPassword(),
        '/login': (context) => const SignUp(),
        '/home': (context) => const HomePage(),
        '/notifications': (context) => const NotificationPage(),
        '/workoutCategories': (context) => const WorkoutCategories(),
        '/bottomNavigationbar': (context) => const HomepageNavbar(),
        '/profile': (context) => const ProfilePage(),
        '/privacyPolicy': (context) => const PrivacyPolicyPage(),
        '/settings': (context) => const SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const HomepageNavbar(),
    );
  }
}
