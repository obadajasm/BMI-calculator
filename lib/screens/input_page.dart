import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/cal_widget.dart';
import 'package:flutter_test_app/components/card_widget.dart';
import 'package:flutter_test_app/components/gender_widgetr.dart';

import 'package:flutter_test_app/screens/results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../consts.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 175;
  int weight = 65;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    cardChild:
                        GenderWidget(icon: FontAwesomeIcons.mars, text: "MALE"),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? KActiveCardColor
                        : KInactiveCardColor,
                    cardChild: GenderWidget(
                        icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: CardWidget(
            colour: KActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("HEIGHT", style: KTestStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: KNumStyle),
                    Text(
                      "CM",
                      style: KTestStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8d8e98),
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          //the last row
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardWidget(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: KTestStyle),
                        Text(weight.toString(), style: KNumStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  print(weight);
                                  weight++;
                                  print(weight);
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE", style: KTestStyle),
                        Text(age.toString(), style: KNumStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CalculateWidget(
              title: "CALCULATER",
              ontap: () {
                CalculatorBrain clb =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiRes: clb.calculateBMI(),
                            resinfo: clb.getInfo(),
                            resText: clb.getResult(),
                          )),
                );
              }),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 65.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
