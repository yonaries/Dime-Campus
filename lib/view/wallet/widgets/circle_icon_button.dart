import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  final Color color;

  const CircleIconButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return MaterialButton(
      onPressed: () {},
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: colorScheme.onBackground,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
