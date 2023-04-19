import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/common/appbar.dart';
import '../../core/common/button.dart';
import '../../core/common/transaction_list.dart';
import 'widgets/plan_card.dart';
import 'widgets/plan_header.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: DimeAppBar(
        'Plan Details',
        context,
      ),
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PlanHeader(
              title: 'Plan Title',
              category: 'Category',
              date: 'September 20, 2021',
            ),
            const PlanCard(
              title: '300 credits',
              category: 'Budget',
              current: 100,
              budget: 200,
            ),
            const SizedBox(height: 10),
            DimeButton(
              onTap: () {},
              text: "Deposit",
              color: colorScheme.primary,
            ),
            DimeButton(
              onTap: () {},
              text: "Withdraw",
              color: colorScheme.secondary,
            ),
            const SizedBox(height: 10),
            const TransactionList()
          ],
        ),
      ),
    );
  }
}
