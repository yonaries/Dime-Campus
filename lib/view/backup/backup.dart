import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuvio/view/backup/widgets/backup_card.dart';

import 'package:nuvio/view/vote/widgets/reserve_vote.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup and Restore'),
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
      body: const BackupRestore(),
    );
  }
}
