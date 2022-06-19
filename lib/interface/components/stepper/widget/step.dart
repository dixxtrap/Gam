import 'package:flutter/material.dart';

class AppStep {
  String label;

  Widget content;

  String? current;
  Map data;
  AppStep(
      {required this.label,
      required this.content,
      this.current,
      required this.data});
}
