import 'package:flutter/material.dart';
import 'package:lucky_wheel_clean_architecture/core/colors/colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: primaryColor,
  buttonTheme: ButtonThemeData(buttonColor: buttonBackgroundDark),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    surface: Colors.white,
    secondary: buttonBackgroundDark,
    brightness: Brightness.dark,
  ),

  fontFamily: 'Mont',
);

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  scaffoldBackgroundColor: lightPrimaryColor,

  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
    surface: Colors.white,
    secondary: buttonBackgroundDark,
  ),

  fontFamily: 'Mont',
);
