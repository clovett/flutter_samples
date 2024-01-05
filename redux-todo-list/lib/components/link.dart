import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final bool active;
  final String text;
  final VoidCallback onPressed;

  const Link({
    super.key,
    required this.active, 
    required this.text, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(
        active ? Theme.of(context).primaryColor : null),
        foregroundColor: MaterialStateProperty.all(
          active ? Theme.of(context).primaryColorLight : 
          Theme.of(context).primaryColor),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
