import 'package:fitness_app_live/Provider/user_provider.dart';
import 'package:fitness_app_live/models/DetailPageButton.dart';
import 'package:fitness_app_live/models/DetailPageTitle.dart';
import 'package:fitness_app_live/models/ListWheelViewScroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int selectedAgeIndex = 50; // Default to the middle of the list

  @override
  Widget build(BuildContext context) {
    List<String> items = List.generate(99, (index) => (index + 1).toString());
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<UserProvider>( // Use the existing UserProvider
        builder: (context, userProvider, _) {
          return Container(
            padding: EdgeInsets.only(
              top: size.height * 0.06,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.03,
            ),
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                const DetailPageTitle(
                  title: "How Old Are You?",
                  text: "This will help us to create personalized content for you",
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
                        selectedAgeIndex = index; // Update the selected index
                      });
                    },
                  ),
                ),
                DetailPageButton(
                  text: 'Next',
                  onTap: () {
                    // Get the currently selected age from the wheel
                    int selectedAge = int.parse(items[selectedAgeIndex]);
                    userProvider.setAge(selectedAge); // Set age in the UserProvider
                    Navigator.pushNamed(context, '/weight');
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
