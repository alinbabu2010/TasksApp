import 'package:flutter/material.dart';

class PopupTextButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const PopupTextButton({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: null,
      icon: Icon(icon),
      label: Text(label),
      style: ButtonStyle(
          foregroundColor:
              MaterialStatePropertyAll(Colors.deepOrangeAccent.shade200)),
    );
  }
}
