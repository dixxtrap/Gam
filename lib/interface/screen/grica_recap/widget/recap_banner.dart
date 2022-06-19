import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grica/interface/utils/constant/constant.dart';

class RecapBanner extends StatelessWidget {
  const RecapBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: getW(context),
      child: Stack(
        children: [
          SizedBox(
            width: getW(context),
            child: SvgPicture.asset(
              "assets/svg/divider1.svg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: defaultPadding * 2),
              child: SizedBox(
                height: 180,
                child: SvgPicture.asset(
                  "assets/svg/recap.svg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
