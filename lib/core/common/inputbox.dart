import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    required TextEditingController controller,
    required this.label,
    this.hint = '',
    this.keyboard = TextInputType.text,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String label;
  final String hint;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: colorScheme.onBackground, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: TextField(
              controller: _controller,
              keyboardType: keyboard,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.5),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                fillColor: colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
