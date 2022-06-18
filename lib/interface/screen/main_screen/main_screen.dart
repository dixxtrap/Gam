import 'package:flutter/material.dart';
import 'package:grica/interface/utils/constant/constant.dart';
import 'widget/custom_app_bar.dart';

class MainScreen extends StatelessWidget {
  final String? title;
  final Widget child;
  final Color? color;
  final bool scroll;
  final Widget? appBar;
  final bool withAppBar;
  const MainScreen(
      {Key? key,
      required this.child,
      this.title,
      this.color,
      this.appBar,
      this.withAppBar = true,
      this.scroll = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        backgroundColor: color ?? Colors.white,
        body: SizedBox(
          height: getH(context),
          child: Stack(children: [
            if (scroll) SingleChildScrollView(child: child) else child,
            if (withAppBar)
              Align(
                alignment: Alignment.topCenter,
                child: appBar ??
                    CustomAppBar(
                      title: "$title",
                    ),
              )
          ]),
        ));
  }
}
