import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SmallPlanCard extends StatelessWidget {
  const SmallPlanCard({
    super.key,
    required this.colorScheme,
    required this.title,
    required this.category,
    required this.current,
    required this.budget,
  });

  final ColorScheme colorScheme;
  final String title;
  final String category;
  final int current;
  final int budget;

  @override
  Widget build(BuildContext context) {
    final double percent = (current / budget) * 100;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            LinearPercentIndicator(
              width: 120.0,
              lineHeight: 8.0,
              animation: true,
              animationDuration: 1000,
              leading: Text(
                current.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                budget.toString(),
                style: TextStyle(color: colorScheme.onSurface),
              ),
              percent: percent / 100,
              barRadius: const Radius.circular(50),
              progressColor: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
