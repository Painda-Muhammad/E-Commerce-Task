import 'package:flutter/material.dart';

class KTextTheme {
  KTextTheme._();

  static final lightTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(
      fontSize:34,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: 'Metropolis'
      
    ),
    titleMedium: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
  );

  static final darkTextTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
  );
}
