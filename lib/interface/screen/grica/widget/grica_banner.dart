import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grica/interface/utils/constant/constant.dart';
import 'package:grica/interface/utils/theme/colors.dart';

class GricaBanner extends StatelessWidget {
  const GricaBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: defaultPadding * 3,
          color: Colors.white,
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: defaultPadding * 2,
          ),
          height: 320,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: const [
                    Text("Grica Service",
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: primaryColor)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: Container(
                    height: 160,
                    width: 160,
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(.1)),
                    child: SvgPicture.asset(
                      "assets/svg/disaster.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: getW(context),
                  height: 150,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: SvgPicture.asset(
                        "assets/svg/Base.svg",
                        fit: BoxFit.cover,
                        height: 150,
                        color: primaryColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: primaryColor,
                      ),
                    ),
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 5,
                  width: getW(context),
                  color: primaryColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
