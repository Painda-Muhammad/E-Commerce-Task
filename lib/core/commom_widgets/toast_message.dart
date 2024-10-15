

import 'package:flutter/material.dart';
 toastMessage({required BuildContext context, required toastMsg,Color color =Colors.grey}){
  ScaffoldMessenger.of(context).showSnackBar(
  
    SnackBar(
      backgroundColor: color,
      content:Text(toastMsg),),
  );
}