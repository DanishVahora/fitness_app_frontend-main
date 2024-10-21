// ignore_for_file: avoid_print
import 'package:fitness_app_live/screens/OnBoardingScreen/onBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/auth_provider.dart';
import '../../constants/color.dart';
import '../homeScreen/bottomNavigationbar.dart';
import 'dart:convert'; // Import the JSON decode utility


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late PageController _pageController;
  bool isLoginSelected = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isNotValidate = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void loginUser() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      bool success = await authProvider.loginUser(
        _emailController.text,
        _passwordController.text,
      );

      if (success) {
        // If login is successful, navigate to homepage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomepageNavbar(),
          ),
        );
      } else {
        // If login fails, show snackbar with error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid credentials. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // If fields are empty, show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }





  void signupUser() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _nameController.text.isNotEmpty) {
      try {
        // Call signupUser and expect a response
        var response = await authProvider.signupUser(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
        );

        // Check if the response is 'success'
        if (response == 'success') {
          print('User registered successfully');

          // Navigate to OnBoardingScreen after successful registration
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
          );
        } else {
          // Handle specific errors
          String errorMessage = '';

          // Customize this check based on your actual API response structure
          if (response == 'UserAlreadyExists') {
            errorMessage = 'User already exists. Please try logging in.';
          } else {
            errorMessage = 'Signup failed. Please try again.';
          }

          // Show error message to the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      } catch (error) {
        print('Signup error: $error');
        // Show a generic error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred.')),
        );
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
      print('Please fill in all fields');
    }
  }




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              isLoginSelected
                  ? 'assets/onboardingImages/img_background_2.png'
                  : 'assets/onboardingImages/Background.png',
              height: size.height * 0.65,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:
                    isLoginSelected ? PrimaryColor : Colors.white,
                    textStyle: TextStyle(
                        shadows: isLoginSelected
                            ? const [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(5.0, 5.0),
                          ),
                        ]
                            : null),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: isLoginSelected ? 22 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 05),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor:
                    isLoginSelected ? Colors.white : PrimaryColor,
                    textStyle: TextStyle(
                      shadows: isLoginSelected
                          ? null
                          : const [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: isLoginSelected ? 20 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                isLoginSelected
                    ? const CircleAvatar(
                  radius: 25,
                  backgroundImage:
                  AssetImage('assets/images/profile.jpg'),
                )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                isLoginSelected
                    ? "Welcome back, \nSarah".toUpperCase()
                    : "Hello rookies".toUpperCase(),
                style: TextStyle(
                  fontSize: size.width * 0.095,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            top: size.height * (isLoginSelected ? 0.62 : 0.52),
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height * 0.5,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLoginSelected = index == 0;
                  });
                },
                children: [
// Login Page
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgotpassword');
                              },
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: PrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.075),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
// Add Google sign-in logic
                                },
                                child: Image.asset(
                                  'assets/images/google.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
// Add Apple sign-in logic
                                },
                                child: Image.asset(
                                  'assets/images/apple.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  loginUser();
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
// Sign Up Page
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.075),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  signupUser();
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}