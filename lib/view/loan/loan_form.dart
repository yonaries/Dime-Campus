import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nuvio/core/common/input_image.dart';

import '../../core/common/appbar.dart';
import '../../core/common/button.dart';
import '../../core/common/inputbox.dart';
import '../../core/common/inputdate.dart';

class LoanFormScreen extends StatefulWidget {
  const LoanFormScreen({super.key});

  @override
  State<LoanFormScreen> createState() => _LoanFormScreenState();
}

class _LoanFormScreenState extends State<LoanFormScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextEditingController _plan = TextEditingController();
    final TextEditingController _budget = TextEditingController();
    final TextEditingController _until = TextEditingController();
    final TextEditingController _category = TextEditingController();
    bool _isAgreed = true;
    File? _image;

    return Scaffold(
      appBar: DimeAppBar('Loan Register', context),
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputBox(
              controller: _plan,
              label: 'Full Name',
              hint: 'eg. Yonathan Dejene',
            ),
            InputBox(
              controller: _budget,
              label: 'Phone',
              hint: '251*********',
              keyboard: TextInputType.number,
            ),
            InputImage(
              image: _image,
              label: 'Photo',
            ),
            InputBox(
              controller: _category,
              label: 'Category',
              hint: 'eg. transport',
              keyboard: TextInputType.datetime,
            ),
            SizedBox(
              child: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    activeColor: colorScheme.primary,
                    side: MaterialStateBorderSide.resolveWith(
                      (states) =>
                          BorderSide(width: 1.0, color: colorScheme.primary),
                    ),
                    value: _isAgreed,
                    onChanged: (value) {
                      setState(() {
                        _isAgreed = value!;
                        print(value);
                      });
                    },
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isAgreed = !_isAgreed;
                        });
                      },
                      child: const Text(
                        'By checking this box, I agree to all the terms and conditions.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DimeButton(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
              text: "Save",
              color: colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
