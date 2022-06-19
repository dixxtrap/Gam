import 'package:flutter/material.dart';
import 'package:grica/interface/utils/constant/constant.dart';

import 'package:grica/interface/utils/theme/colors.dart';

// ignore: must_be_immutable
class StepButton extends StatelessWidget {
  Function? onPressed;

  StepButton({Key? key, this.isNext = false, this.onPressed}) : super(key: key);

  bool isNext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(3),
            primary: isNext == false ? Colors.white : primaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPrimary: isNext == false
                ? Theme.of(context).colorScheme.secondary
                : Colors.white),
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: Icon(isNext == true
            ? Icons.keyboard_arrow_down_sharp
            : Icons.keyboard_arrow_up_sharp));
  }
}

// ignore: must_be_immutable
class AppButtonIcon extends StatelessWidget {
  Function? onPressed;

  IconData? icon;
  String? text;
  AppButtonIcon({Key? key, this.icon, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            primary: Theme.of(context).colorScheme.primary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPrimary: Colors.white),
        onPressed: onPressed != null ? () => onPressed!() : null,
        child: Row(
          children: [
            Icon(icon ?? Icons.check_circle_sharp),
            const SizedBox(
              width: 10,
            ),
            Text(
              text ?? "Terminer",
              style: getT(context).bodyText1!.copyWith(color: Colors.white),
            ),
          ],
        ));
  }
}
