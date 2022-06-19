import 'package:flutter/material.dart';
import 'package:grica/core/model/disaster_model.dart';
import 'package:grica/interface/screen/grica/grica_screen.dart';
import 'package:grica/interface/screen/grica_recap/grica_recap.dart';
import 'package:grica/interface/screen/splash/loading.dart';

myPageBuilder(Widget page, Curve curve) => PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      animation = CurvedAnimation(parent: animation, curve: curve);

      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return page;
    });

class GeneratedRoutes {
  static const String home = "/";
  static const String splash = "/spash";
  static const String grica = "/grica";
  static const String recap = "/recap";

  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final Object? args = settings.arguments;
    switch (settings.name) {
      case recap:
        if (args is DisasterModel) {
          return myPageBuilder(
              RecapScreen(
                disaster: args,
              ),
              Curves.linearToEaseOut);
        } else {
          return MaterialPageRoute(builder: (context) => const GricaScreen());
        }

      case grica:
        return myPageBuilder(GricaScreen(), Curves.easeInOut);
      case splash:
        return myPageBuilder(const Loading(), Curves.easeInOut);
      default:
        return MaterialPageRoute(builder: (context) => GricaScreen());
    }
  }

  static navigateTo(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  static navigateToPopAndPush(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.popAndPushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }
}
