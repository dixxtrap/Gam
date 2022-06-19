import 'package:flutter/material.dart';
import 'package:grica/interface/router/generate_route.dart';
import 'package:grica/interface/utils/constant/constant.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  _navigationToHome() async {
    await Future.delayed(const Duration(seconds: 10), () {});
    Navigator.pushReplacementNamed(context, GeneratedRoutes.grica);
  }

  @override
  void initState() {
    super.initState();

    _navigationToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 100,
              child: Image.asset(
                "assets/images/icon2.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 150,
                width: 130,
                child: Image.asset(
                  "assets/images/load.gif",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
          ]),
    ));
  }
}
