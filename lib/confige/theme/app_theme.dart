import 'package:e_commerce_task/confige/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/elevated_button_theme.dart';

class KAppTheme {
  KAppTheme._();
  static final lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xffDB3022),
        onPrimary: Color(0xffFFFFFF),
        surface: Color(0xffFFFFFF),
        onSurface: Color(0xff9B9B9B),
        surfaceContainerHighest: Color(0xff2AA952),
        error: Color(0xffF01F0E),
        onError: Color(0xffFFFFFF),
      ),
      scaffoldBackgroundColor: const Color(0xffF9F9F9),
      textTheme: KTextTheme.lightTextTheme,
      appBarTheme: KAppbarTheme.lightAppBarTheme,
      elevatedButtonTheme: KElevatedButtonTheme.lightElavetedButtonTheme);

  // static final darkTheme = ThemeData(
  //   useMaterial3: true,
  //   brightness: Brightness.dark,
  //   colorScheme: const ColorScheme.dark(
  //     primary: Colors.purple,
  //     onPrimary: Colors.white,
  //     inversePrimary: Colors.black,

  //     background: Colors.black38,
  //     onBackground: Colors.white,

  //     surface: Colors.black54,
  //     onSecondary: Colors.white,
  //   ),

  //   scaffoldBackgroundColor: Colors.black38,

  //   // textTheme: KTextTheme.darkTextTheme,
  //   // appBarTheme: KAppbarTheme.darkAppBarTheme,
  //   // elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme
  // );
}
