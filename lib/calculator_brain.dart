import 'package:flutter/material.dart';
import 'dart:math';

double _bmi = 0.0;
double bmi = 0.0;

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    bmi = _bmi;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return "You have higer than normal body weight. Try to exercise more";
    } else if (bmi > 18.5) {
      return "You have a normal body weight. Goodjob ! !";
    } else {
      return "You have lower than normal body weight. Try to eat a bit more";
    }
  }
}
