import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  // ignore: non_constant_identifier_names
  double _BMI;
  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI >= 25) {
      return 'OverWeight';
    } else if (_BMI > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return 'Your Weight is higher than normal body weight , you should Exercise more !';
    } else if (_BMI > 18.5) {
      return 'Your Body Weight is Normal ! Good Job !';
    } else {
      return 'Your Weight is Lower than normal body weight , you should Eat more ! ';
    }
  }
}
