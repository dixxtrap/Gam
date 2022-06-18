import 'package:flutter/material.dart';
import 'package:grica/interface/router/generate_route.dart';
import 'package:grica/interface/utils/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theming.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: GeneratedRoutes.splash,
      onGenerateRoute: (seting) => GeneratedRoutes.onGeneratedRoute(seting),
    );
  }
}
