import 'package:flutter/material.dart';

import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Padding(
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
            height: height * 0.65,
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
    );
  }
}
