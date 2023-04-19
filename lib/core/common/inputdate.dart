import 'package:flutter/material.dart';

class InputDate extends StatelessWidget {
  const InputDate({
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

    String formatData(String date) {
      final date = DateTime.parse("2019-04-16 12:18:06.018950");
      final formattedDate = "${date.year}-${date.month}-${date.day}";
      return formattedDate;
    }

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
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050),
                    builder: ((context, child) {
                      return Theme(
                        data: theme.copyWith(
                          colorScheme: colorScheme.copyWith(
                            primary: colorScheme.primary,
                            onPrimary: colorScheme.onPrimary,
                            surface: colorScheme.surface,
                            onSurface: colorScheme.onSurface,
                          ),
                          dialogBackgroundColor: colorScheme.background,
                        ),
                        child: child!,
                      );
                    }));

                if (pickedDate != null) {
                  _controller.text = formatData(pickedDate.toString());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
