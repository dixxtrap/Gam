import 'package:flutter/material.dart';
import 'package:grica/interface/screen/main_screen/widget/section_title.dart';
import 'package:grica/interface/utils/constant/constant.dart';

class RecapItem extends StatelessWidget {
  final String title;

  final String value;

  const RecapItem({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPadding / 2),
      width: getW(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(text: title),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: defaultPadding * 1.5),
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
