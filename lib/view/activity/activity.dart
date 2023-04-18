import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        backgroundColor: colorScheme.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorScheme.background,
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
      body: const Center(
        child: Text('Activity'),
      ),
    );
  }
}
