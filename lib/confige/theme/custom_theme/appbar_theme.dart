

import 'package:flutter/material.dart';

class KAppbarTheme{

 const KAppbarTheme._();

  static const lightAppBarTheme =  AppBarTheme(
      backgroundColor:Color(0xffF9F9F9),
      elevation: 0.0,
      titleTextStyle: TextStyle( 
      color: Color(0xFF222222),
      fontWeight: FontWeight.w400,
      fontSize: 18,
      wordSpacing: .9 
      ),
      centerTitle: true,
    );

    static const darkAppBarTheme =  AppBarTheme(
      backgroundColor: Colors.purple,
      elevation: 0,
titleTextStyle: TextStyle(
      color:Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 22,
      wordSpacing: .9 

)
    );
}