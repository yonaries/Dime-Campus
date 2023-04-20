import 'package:flutter/material.dart';

class BackupRestore extends StatelessWidget {
  const BackupRestore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Expanded(
            child: Column(
          children: [
            const Text(
              'Backup your account with just one click! Keep your important data safe and secure by downloading a backup file onto your device.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The file can be used to recover your account In-case device was lost or app was not  functional.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            SizedBox(
              width: width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Backup', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondary,
                  foregroundColor: colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Restore', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        )));
  }
}
