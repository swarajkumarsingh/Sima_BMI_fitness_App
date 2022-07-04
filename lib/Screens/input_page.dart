import 'package:fitness_app/System/Central_System.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/Screens/results_page.dart';
import 'package:fitness_app/widget/RoundIconButton.dart';
import 'package:fitness_app/widget/icon_content.dart';
import 'package:fitness_app/widget/reUseAbleCard.dart';
import 'package:fitness_app/widget/nav_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI calculator"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReUseAbleCard(
                      selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      const IconContent(Icons.male, "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReUseAbleCard(
                      selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      const IconContent(Icons.female, "FEMALE"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUseAbleCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: kMinSliderValue,
                        max: kMaxSliderValue,
                        label: height.toString(),
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseAbleCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              Icons.add,
                              () => setState(() {
                                weight--;
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              Icons.minimize,
                              () => setState(() {
                                weight++;
                              }),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseAbleCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              Icons.minimize,
                              () => setState(() {
                                age--;
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              Icons.add,
                              () => setState(() {
                                age++;
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          NavButton("CALCULATE", () {
            CentralSystem CS = CentralSystem(height: height, weight: weight);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => ResultsPage(CS.calculateBMI(), CS.getResult(), CS.getInterpretation(), CS.getScore())));
          }),
        ],
      ),
    );
  }
}
