import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/user_provider.dart'; // Import UserProvider
import '../../models/DetailPageButton.dart';
import '../../models/DetailPageTitle.dart';
import '../../models/ListWheelViewScroller.dart';
import '../homeScreen/bottomNavigationbar.dart';
import '../homeScreen/homeScreen.dart';

class ActivityLevelPage extends StatefulWidget {
  const ActivityLevelPage({super.key});

  @override
  State<ActivityLevelPage> createState() => _ActivityLevelPageState();
}

class _ActivityLevelPageState extends State<ActivityLevelPage> {
  int selectedActivityIndex = 0; // Default index for the first activity level

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Rookie',
      'Beginner',
      'Intermediate',
      'Advanced',
      'Pro',
    ];

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
              top: size.height * 0.06,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.03,
            ),
            child: Column(
              children: [
                const DetailPageTitle(
                  text: 'This helps us to create a personalized plan for you',
                  title: "What is your Activity Level?",
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.055,
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: ListWheelScrollViewWidget(
                    items: items,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedActivityIndex = index; // Update selected activity index
                      });
                    },
                  ),
                ),
                DetailPageButton(
                  text: 'Next',
                  onTap: () {
                    String selectedActivity = items[selectedActivityIndex]; // Get the selected activity level
                    userProvider.setActivityLevel(selectedActivity); // Set activity level in UserProvider
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomepageNavbar(),
                      ),
                    );
                  },
                  showBackButton: true,
                  onBackTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
