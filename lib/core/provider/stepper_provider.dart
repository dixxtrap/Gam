import 'package:flutter/widgets.dart';

class StepperProvider with ChangeNotifier {
  int currentStep = 0;
  int stepDone = 0;
  changeStepDone(int i) {
    stepDone += i;
    notifyListeners();
  }

  changeCurrentIndex(int i) {
    currentStep = i;
    notifyListeners();
  }
}
