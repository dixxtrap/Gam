import 'package:flutter/material.dart';

double getW(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

TextTheme getT(BuildContext context) => Theme.of(context).textTheme;

double getH(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

const double defaultPadding = 16;
bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;

String mySplitString(String chaine) {
  var t = chaine.split(" ");
  String code = "";
  if (t.length < 2) {
    if (t[0].length > 3) {
      code = t[0].substring(0, 3);
    } else {
      code += t[0].substring(0, 1);
    }
  } else {
    for (var element in t) {
      var tap = element.split(" ' , )");
      for (var i in tap) {
        if (i.length > 5) {
          code += i.substring(0, 1);
        }
      }
    }
  }

  return code.toString().toLowerCase();
}
