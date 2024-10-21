import 'package:fitness_app_live/Provider/user_provider.dart';
import 'package:fitness_app_live/models/DetailPageButton.dart';
import 'package:fitness_app_live/models/DetailPageTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/ListWheelViewScroller.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  int selectedWeightIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    for (int i = 30; i < 200; i++) {
      items.add(i.toString());
    }
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<UserProvider>(
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
                  title: "What's Your Weight?",
                  text: "This helps us tailor content just for you.",
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
                        selectedWeightIndex = index; // Update the selected index
                      });
                    },
                  ),
                ),
                DetailPageButton(
                  text: 'Next',
                  onTap: () {
                    // Get the selected weight based on the index
                    int selectedWeight = int.parse(items[selectedWeightIndex]);
                    userProvider.setWeight(selectedWeight.toString()); // Set weight in the UserProvider
                    Navigator.pushNamed(context, '/height'); // Navigate to the next page
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
