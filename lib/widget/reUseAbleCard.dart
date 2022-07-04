import 'package:flutter/material.dart';

class ReUseAbleCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  ReUseAbleCard(this.colour, this.cardChild);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}