import 'package:fitness_app/constants/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconName;
  final String label;

  const IconContent(this.iconName, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
