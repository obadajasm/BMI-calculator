import 'package:flutter/material.dart';
import 'package:flutter_test_app/consts.dart';

class CardWidget extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  CardWidget({this.colour = KActiveCardColor, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
