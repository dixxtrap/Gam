// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:grica/interface/components/stepper/widget/step.dart';
import 'package:grica/interface/utils/constant/constant.dart';

class StepperProgressIndicator extends StatelessWidget {
  StepperProgressIndicator(
      {Key? key, required this.steps, required this.currentStep})
      : super(key: key);
  int currentStep;
  List<AppStep> steps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      child: TweenAnimationBuilder(
        tween: Tween<double>(
            begin: currentStep / steps.length,
            end: (currentStep) / steps.length),
        duration: const Duration(seconds: 1),
        builder: (_, double value, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Progression"),
                  Text((value * 100).toInt().toString() + "%")
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 10,
                backgroundColor: Colors.black.withOpacity(0.26),
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            )
          ],
        ),
      ),
    );
  }
}
