import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  InputImage({
    super.key,
    required this.image,
    required this.label,
    this.hint = '',
    this.keyboard = TextInputType.text,
  });

  File? image;
  final String label;
  final String hint;
  final TextInputType keyboard;

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        widget.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

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
            widget.label,
            style: TextStyle(color: colorScheme.onBackground, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: TextField(
              keyboardType: widget.keyboard,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: widget.hint,
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
                await pickImage(ImageSource.camera);
              },
            ),
          )
        ],
      ),
    );
  }
}
