import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:nuvio/view/vote/widgets/reserve_vote.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserve Vote'),
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
      backgroundColor: colorScheme.background,
      body: const ReserveVote(
        title: '75%',
        category: 'Current reserve percentage',
        current: 160,
        budget: 200,
      ),
    );
  }
}
