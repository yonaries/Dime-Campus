import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuvio/view/activity/widgets/chart.dart';

import '../../core/common/transaction_card.dart';
import '../../core/common/transaction_list.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list_rounded,
                color: Colors.white,
              )),
        ],
      ),
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Center(
              child: SizedBox(
                child: Chart(),
              ),
            ),
            TransactionList()
          ],
        ),
      ),
    );
  }
}
