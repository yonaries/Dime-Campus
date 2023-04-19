import 'package:flutter/material.dart';

class DimeButton extends StatelessWidget {
  const DimeButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
  });

  final Function onTap;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Container(
          height: 50,
          width: width,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
