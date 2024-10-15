
import 'package:flutter/material.dart';

class KElevatedButtonTheme{

  const KElevatedButtonTheme._();

  static final lightElavetedButtonTheme =  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey  ,
      disabledForegroundColor: Colors.grey,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10)
    )
   );

   static final darkElevatedButtonTheme =  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey  ,
      disabledForegroundColor: Colors.white,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10)

    )
   );
}