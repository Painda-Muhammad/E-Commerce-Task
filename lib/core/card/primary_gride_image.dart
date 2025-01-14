import 'package:flutter/material.dart';

class PrimaryGridImage extends StatelessWidget {
  const PrimaryGridImage({
    super.key,
    this.height,
    this.imagePath,
    required this.childWidget,
  });

  final double? height;
  final String? imagePath;
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? MediaQuery.of(context).size.height / 2,
        child: Stack(
          fit: StackFit.expand,
          children: [
            imagePath != null
                ? Image.asset(
                    fit: BoxFit.fill,
                    imagePath!,
                  )
                : const SizedBox(),
            childWidget,
          ],
        ));
  }
}
