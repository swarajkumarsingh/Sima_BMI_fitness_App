import 'dart:math';

class CentralSystem {
  final int height;
  final int weight;

  CentralSystem({
    required this.height,
    required this.weight,
  });

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 15) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getScore() {
    if (_bmi >= 15) {
      return "0";
    } else if (_bmi > 18.5) {
      return "1";
    } else {
      return "2";
    }
  }

  String getInterpretation() {
    if (_bmi >= 15) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
