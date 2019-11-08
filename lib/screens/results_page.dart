import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/cal_widget.dart';
import 'package:flutter_test_app/components/card_widget.dart';
import 'package:flutter_test_app/consts.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiRes, this.resinfo, this.resText});

  final String bmiRes;
  final String resText;
  final String resinfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: KYourStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardWidget(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resText.toUpperCase(), style: KResStyle),
                  Text(bmiRes, style: KBMIStyle),
                  Text(
                    resinfo,
                    style: KBMIMsgStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CalculateWidget(
              title: "RE- CALCULATER",
              ontap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
