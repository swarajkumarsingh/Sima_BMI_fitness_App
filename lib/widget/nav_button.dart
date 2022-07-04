import 'package:flutter/material.dart';

import '../constants/constants.dart';

class NavButton extends StatelessWidget {

  final String buttonTitle;
  final Function onPressed;

  NavButton(this.buttonTitle, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(buttonTitle, style: kLargeButtonTextStyle),
        ),
      ),
    );
  }
}