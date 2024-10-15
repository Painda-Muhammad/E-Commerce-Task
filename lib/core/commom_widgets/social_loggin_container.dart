import 'package:flutter/material.dart';

class SocialLoginContainer extends StatelessWidget {
  const SocialLoginContainer({required this.ontap,required this.imagePath, super.key});
    final Function()? ontap;
    final String imagePath;
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: ontap,
      child: Container(
        padding:const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                          height: 64,
                          width: 92,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(24)
                          ),
                            child: Image.asset(imagePath),
                         ),
    ) ;
  }
}