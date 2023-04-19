import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar DimeAppBar(String title, BuildContext context) {
  final ThemeData theme = Theme.of(context);
  final ColorScheme colorScheme = theme.colorScheme;

  return AppBar(
    title: Text(title),
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
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: colorScheme.onBackground,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 15,
          color: Colors.white,
        ),
      ),
    ),
  );
}
