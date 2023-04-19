import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuvio/view/activity/widgets/chart.dart';

import '../../core/common/transaction_card.dart';

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
      body: Column(
        children: [
          const Center(
            child: SizedBox(
              child: Chart(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'Transaction History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 233,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const TransactionCard(
                        transaction: TransactionType.received,
                        amount: 100,
                        message: 'Receive to John Doe',
                        date: 'Today, 12:00 PM',
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
