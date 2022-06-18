import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grica/interface/utils/constant/constant.dart';
import 'package:grica/interface/utils/theme/colors.dart';

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getW(context),
      child: Row(children: [
        const SizedBox(width: defaultPadding / 2),
        Container(
          width: 6,
          height: 25,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        const SizedBox(width: defaultPadding / 2),
        SizedBox(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: GoogleFonts.oswald().fontFamily),
          ),
        ),
      ]),
    );
  }
}
