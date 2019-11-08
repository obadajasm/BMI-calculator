import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    print("$_bmi");
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "overweight";
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return "underweight";
    }
  }

  String getInfo() {
    if (_bmi >= 25.0) {
      return "You have a higher than normal body weight . tr to exercise more";
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job !';
    } else {
      return "You have a lower than normal body weight. You can eat a bit more";
    }
  }
}
