import 'dart:ui';

import 'package:bootstrap_icons/bootstrap_icons.dart';

import 'package:flutter/material.dart';

import '../../../router/generate_route.dart';
import '../../../utils/constant/constant.dart';

import '../../../utils/theme/colors.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor.withOpacity(.3),
      height: 40,
      child: Stack(
        children: [
          ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: defaultPadding / 8),
                    child: Row(
                      textBaseline: TextBaseline.ideographic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          size: 30,
                          icon: const Icon(
                            Icons.chevron_left,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        CustomIconButton(
                          size: 30,
                          icon: const Icon(
                            BootstrapIcons.house,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                GeneratedRoutes.home, (route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
