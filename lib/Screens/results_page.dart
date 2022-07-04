import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/widget/nav_button.dart';
import 'package:fitness_app/widget/reUseAbleCard.dart';
import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String score;

  ResultsPage(this.bmiResult, this.resultText, this.interpretation, this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sima's Fitness APP"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReUseAbleCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          NavButton(
            "Re-Calculate",
            () => Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (ctx) => const InputPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
