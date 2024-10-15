import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer(
      {super.key,
      required this.title,
      this.isAbscure = false,
      this.focusNode,
      required this.controller});
  final String title;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool isAbscure;
  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.only(left: 10),
      constraints: const BoxConstraints(maxHeight: 64),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onSurface),
      child: TextFormField(
        focusNode: widget.focusNode,
        key: widget.key,
        obscureText: widget.isAbscure,
        controller: widget.controller,
        style: TextStyle(
          color: Theme.of(context).colorScheme.surface,
        ),
        decoration: InputDecoration(
          hintText: widget.title,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w200),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

//