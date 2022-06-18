import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFB444FF);
const screeBg = Color(0xFFfcf3ff);

class Theming {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final lightTheme = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        colorScheme: colorScheme,
        fontFamily: 'Poppins',
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          bodyText1: GoogleFonts.oswald(),
        ),
        appBarTheme: AppBarTheme(
            titleSpacing: 0,
            elevation: 0,
            toolbarHeight: 50,
            backgroundColor: colorScheme.primary,
            titleTextStyle: const TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        scaffoldBackgroundColor: colorScheme.background,
        focusColor: focusColor,
        canvasColor: const Color(0xFFf2f4f2),
        cardColor: const Color(0xFFf2f2f6),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent));
  }

  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: primaryColor,
    secondary: primaryColor.withOpacity(.5),
    background: const Color(0xFFf9f9f9),
  );
}
