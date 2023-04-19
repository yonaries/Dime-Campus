import 'package:flutter/material.dart';

import '../../core/common/appbar.dart';
import '../../core/common/button.dart';
import '../../core/common/inputbox.dart';
import '../../core/common/inputdate.dart';

class EditPlanScreen extends StatefulWidget {
  const EditPlanScreen({super.key});

  @override
  State<EditPlanScreen> createState() => _EditPlanScreenState();
}

class _EditPlanScreenState extends State<EditPlanScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextEditingController _plan = TextEditingController();
    final TextEditingController _budget = TextEditingController();
    final TextEditingController _until = TextEditingController();
    final TextEditingController _category = TextEditingController();

    return Scaffold(
      appBar: DimeAppBar('Edit Plan', context),
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputBox(
              controller: _plan,
              label: 'Plan',
              hint: 'eg. Food & Drink',
            ),
            InputBox(
              controller: _budget,
              label: 'Budget',
              hint: 'eg. 450',
              keyboard: TextInputType.number,
            ),
            InputDate(
              controller: _until,
              label: 'Until',
              hint: 'eg. 2021-12-31',
              keyboard: TextInputType.datetime,
            ),
            InputBox(
              controller: _category,
              label: 'Category',
              hint: 'eg. transport',
              keyboard: TextInputType.datetime,
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
