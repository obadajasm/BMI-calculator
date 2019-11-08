import 'package:flutter/material.dart';
import '../consts.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  GenderWidget({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 50.0),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: KTestStyle),
      ],
    );
  }
}
