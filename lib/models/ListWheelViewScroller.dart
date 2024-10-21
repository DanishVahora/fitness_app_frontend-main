import 'package:flutter/material.dart';

import '../constants/color.dart';

class ListWheelScrollViewWidget extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int> onSelectedItemChanged; // Callback for item selection

  const ListWheelScrollViewWidget({
    super.key,
    required this.items,
    required this.onSelectedItemChanged, // Make this required
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      magnification: 1.3,
      useMagnifier: true,
      overAndUnderCenterOpacity: 0.19,
      physics: const FixedExtentScrollPhysics(),
      controller: FixedExtentScrollController(initialItem: items.length ~/ 2),
      itemExtent: 50,
      diameterRatio: 1.5,
      onSelectedItemChanged: onSelectedItemChanged, // Add this line
      children: items.map((level) {
        return Text(
          level,
          style: const TextStyle(
            fontSize: 30,
            color: PrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        );
      }).toList(),
    );
  }
}
