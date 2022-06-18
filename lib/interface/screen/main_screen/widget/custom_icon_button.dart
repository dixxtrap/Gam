// ignore: file_names

import 'package:flutter/material.dart';
import 'package:grica/interface/utils/constant/constant.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final double? size;
  final Icon icon;
  final Color? backgroung;
  const CustomIconButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.backgroung,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            minimumSize: Size(size ?? 36, size ?? 36),
            padding: const EdgeInsets.all(defaultPadding / 4),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: backgroung ?? Colors.white60),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            backgroundColor: backgroung ?? Colors.white60),
        onPressed: () => onPressed(),
        child: icon);
  }
}
