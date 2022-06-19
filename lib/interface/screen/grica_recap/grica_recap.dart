import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grica/core/model/disaster_model.dart';
import 'package:grica/interface/screen/grica_recap/widget/recap.dart';
import 'package:grica/interface/screen/grica_recap/widget/recap_banner.dart';
import 'package:grica/interface/screen/main_screen/main_screen.dart';
import 'package:grica/interface/utils/constant/constant.dart';

class RecapScreen extends StatelessWidget {
  final DisasterModel disaster;
  const RecapScreen({Key? key, required this.disaster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      title: "",
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RecapBanner(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding,
                horizontal: defaultPadding,
              ),
              child: RecapGrica(disaster: disaster),
            )
          ]),
    );
  }
}
