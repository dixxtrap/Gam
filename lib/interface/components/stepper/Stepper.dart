// ignore: file_names
// ignore_for_file: file_names, unused_import, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:grica/core/provider/stepper_provider.dart';
import 'package:grica/interface/components/stepper/widget/step.dart';
import 'package:grica/interface/components/stepper/widget/step_button.dart';
import 'package:grica/interface/components/stepper/widget/step_i.dart';
import 'package:grica/interface/components/stepper/widget/stepper_progress_indicator.dart';
import 'package:grica/interface/utils/constant/constant.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppStepper extends StatelessWidget {
  final List<AppStep> steps;

  final Function onFinal;

  final String? title;
  final int stepDone;
  const AppStepper(
      {Key? key,
      required this.steps,
      required this.onFinal,
      this.title,
      required this.stepDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StepperProvider(),
      child: Consumer<StepperProvider>(
        builder: (context, stepperProvider, child) {
          return SizedBox(
            width: getW(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepperProgressIndicator(
                  steps: steps,
                  currentStep: stepDone,
                ),
                StepperBody(
                  title: title,
                  steps: steps,
                  onFinal: onFinal,
                  currentStep: stepperProvider.currentStep,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class StepperBody extends StatelessWidget {
  final int currentStep;

  const StepperBody(
      {Key? key,
      required this.title,
      required this.steps,
      required this.onFinal,
      required this.currentStep})
      : super(key: key);

  final String? title;
  final List<AppStep> steps;
  final Function onFinal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        defaultPadding / 2,
      ),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Theme.of(context).colorScheme.background.withOpacity(.95)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: defaultPadding,
            width: getW(context),
          ),
          Text(
            title ?? "Nothing",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          ...List.generate(
            steps.length,
            (idx) => AppStepI(
                step: steps[idx],
                idx: idx,
                isCurrentIndex: currentStep == idx,
                isActive: currentStep > idx,
                isLast: steps.length == idx + 1),
          ),
          if (currentStep + 1 == steps.length)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButtonIcon(
                onPressed: onFinal,
              ),
            )
        ]),
      ),
    );
  }
}
