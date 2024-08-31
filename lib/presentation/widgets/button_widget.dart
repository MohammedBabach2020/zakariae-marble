import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size(150, 65)),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
