import 'package:flutter/material.dart';

enum TransactionType { sent, received }

class TransactionCard extends StatelessWidget {
  final TransactionType transaction;
  final double amount;
  final String date;
  final String message;

  const TransactionCard({
    super.key,
    required this.transaction,
    required this.amount,
    required this.date,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return SizedBox(
      height: 50,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: transaction == TransactionType.sent
                ? const Color(0xFFb2d0ce)
                : colorScheme.secondary,
            child: Icon(
              transaction == TransactionType.sent
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Sent to John',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'Today, 10:00 AM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            (transaction == TransactionType.sent) ? '-\$$amount' : '\$$amount',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
