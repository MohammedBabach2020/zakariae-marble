import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.hidden,
      required this.controller});

  final String labelText, hintText;
  final bool hidden;
  final TextEditingController controller;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool hidden = false;

  @override
  void initState() {
    hidden = widget.hidden;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: hidden,
        style: TextStyle(
            fontSize: 18.0, color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 3.5),
                borderRadius: const BorderRadius.all(Radius.circular(45))),
            suffixIcon: widget.hidden == true
                ? GestureDetector(
                    child: Icon(hidden
                        ? Icons.remove_red_eye_rounded
                        : Icons.remove_red_eye_outlined),
                    onTap: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                  )
                : const Icon(null),
            labelText: widget.labelText,
            hintText: widget.hintText),
      ),
    );
  }
}
