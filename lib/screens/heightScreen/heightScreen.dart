import 'package:fitness_app_live/Provider/user_provider.dart';
import 'package:fitness_app_live/models/DetailPageButton.dart';
import 'package:fitness_app_live/models/DetailPageTitle.dart';
import 'package:fitness_app_live/models/ListWheelViewScroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  int selectedHeightIndex = 99; // Default index (for 100 cm)

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(200, (index) => (index + 1).toString()); // Generate heights from 1 to 200 cm
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.06,
            ),
            child: Column(
              children: [
                const DetailPageTitle(
                  title: "What is your Height?",
                  text: "This helps us to create a personalized plan for you",
                  color: Colors.white,
                ),
                SizedBox(height: size.height * 0.055),
                SizedBox(
                  height: size.height * 0.5,
                  child: ListWheelScrollViewWidget(
                    items: items,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedHeightIndex = index; // Update the selected height index
                      });
                    },
                  ),
                ),
                DetailPageButton(
                  text: 'Next',
                  onTap: () {
                    // Ensure that you're parsing the selected height correctly
                    int selectedHeight = int.parse(items[selectedHeightIndex]);
                    userProvider.setHeight(selectedHeight); // Set height in UserProvider
                    Navigator.pushNamed(context, '/goal');
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
