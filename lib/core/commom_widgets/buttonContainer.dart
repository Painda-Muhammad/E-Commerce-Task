import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({required this.ontap,required this.title,super.key});
 final String title ;
 final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
                    width: double.infinity,
                    height:  50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primary
                    ),
                    child: Center(
                      child: Text(title,style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 22
                      ),),
                    ),
                  ),
    );
  }
}