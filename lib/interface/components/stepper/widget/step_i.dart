// ignore_for_file: file_names

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:grica/core/provider/stepper_provider.dart';
import 'package:grica/interface/components/stepper/widget/step.dart';
import 'package:grica/interface/components/stepper/widget/step_button.dart';
import 'package:grica/interface/utils/constant/constant.dart';
import 'package:grica/interface/utils/theme/colors.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppStepI extends StatelessWidget {
  bool isActive;

  int idx;

  bool isLast;

  bool isCurrentIndex;

  AppStep step;

  String? value;

  AppStepI({
    Key? key,
    this.isActive = false,
    required this.idx,
    required this.isLast,
    required this.isCurrentIndex,
    required this.step,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      // Check valid or not
                      (step.current != "" && step.current != null
                          ? primaryColor
                          : isActive
                              ? const Color(0xFFcd030c)
                              : Colors.black38)
                  // if Active we check if it is valid

                  ),
              child: (step.current != "" && step.current != null)
                  ? const Icon(
                      BootstrapIcons.check2_all,
                      color: Colors.white,
                      size: 12,
                    )
                  : isActive
                      ? const Icon(
                          BootstrapIcons.x,
                          color: Colors.white,
                          size: 12,
                        )
                      : Text(
                          "${idx + 1}",
                          style: TextStyle(color: Colors.white),
                        ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              step.label,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: getW(context),
          duration: const Duration(seconds: 1),
          child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                  border: isLast
                      ? null
                      : const Border(left: BorderSide(color: Colors.black54))),
              child: Visibility(
                maintainState: true,
                visible: isCurrentIndex,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    step.content,
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer<StepperProvider>(
                      builder: (context, stepperProvider, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StepButton(
                              onPressed: idx != 0
                                  ? () {
                                      stepperProvider
                                          .changeCurrentIndex(idx - 1);
                                    }
                                  : null,
                            ),
                            StepButton(
                              isNext: true,
                              onPressed: isLast
                                  ? null
                                  : () {
                                      stepperProvider
                                          .changeCurrentIndex(idx + 1);
                                    },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable