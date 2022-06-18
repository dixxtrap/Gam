import 'package:flutter/material.dart';
import 'package:grica/interface/screen/main_screen/main_screen.dart';

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
  static const String plateformes = "/plateformes";
  static const String preload = "/preload";

  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final Object? args = settings.arguments;
    switch (settings.name) {
      // case plateformes:
      //   if (args is Map<String, dynamic>) {
      //     return myPageBuilder(
      //         PlateformsScreen(
      //           list: args["options"],
      //           listAge: args["listAge"],
      //           listGenre: args["listGenre"],
      //         ),
      //         Curves.linearToEaseOut);
      //   } else {
      //     return MaterialPageRoute(builder: (context) => const Home());
      //   }

      case home:
        return myPageBuilder(MainScreen(child: Container()), Curves.easeInOut);
      // case splash:
      //   return myPageBuilder(const Splash(), Curves.easeInOut);
      default:
        return MaterialPageRoute(
            builder: (context) => MainScreen(child: Container()));
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
