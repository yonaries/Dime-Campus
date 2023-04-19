import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/plan_card.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans'),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorScheme.surface,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_plan');
        },
        tooltip: 'Create Plan',
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
      backgroundColor: colorScheme.background,
      body: SizedBox(
        height: height,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const PlanCard(
              title: 'New York',
              category: 'Travel',
              current: 160,
              budget: 200,
            );
          },
        ),
      ),
    );
  }
}
