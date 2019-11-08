import 'package:flutter/material.dart';

import '../consts.dart';

class CalculateWidget extends StatelessWidget {
  final String title;
  final Function ontap;
  CalculateWidget({this.title, this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: KButton,
          ),
        ),
        color: KBottomColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
