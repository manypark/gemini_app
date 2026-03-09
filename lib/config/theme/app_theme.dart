import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color colorSeed = Color(0xFF1E1C36);

class AppTheme {

  bool isDarkMode = false;
  AppTheme({ required this.isDarkMode });

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed : colorSeed,
    brightness      : isDarkMode ? Brightness.dark : Brightness.light,
    listTileTheme   : const ListTileThemeData( iconColor: colorSeed ),
    appBarTheme     : const AppBarTheme(
      backgroundColor : colorSeed,
      surfaceTintColor: Colors.transparent,
    )
  );

  static setSystemUIOverlayStyle({ required bool isDarkMode }) {

    final thmeeBrightness = isDarkMode ? Brightness.dark : Brightness.light;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness               : thmeeBrightness,
        statusBarIconBrightness           : thmeeBrightness,
        statusBarColor                    : Colors.transparent,
        systemNavigationBarIconBrightness : thmeeBrightness,
        systemNavigationBarColor          : Colors.transparent
      )
    );
  }
}
