import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ReserveVote extends StatelessWidget {
  const ReserveVote({
    super.key,
    required this.title,
    required this.category,
    required this.current,
    required this.budget,
  });

  final String title;
  final String category;
  final int current;
  final int budget;

  @override
  Widget build(BuildContext context) {
    final double percent = (current / budget) * 100;
    final double width = MediaQuery.of(context).size.width;
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final Color _color = percent > 40
        ? percent > 70
            ? colorScheme.primary
            : colorScheme.secondary
        : colorScheme.error;

    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Expanded(
            child: Column(
          children: [
            Container(
              width: width,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              category,
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // number of votes
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$current',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Votes',
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
            ),

            // TextField
            const SizedBox(height: 10),
            // label for the input field

            //  text at the start of the input field
            const SizedBox(height: 10),
            // input field

            TextField(
                style: TextStyle(
                  fontSize: 25.0,
                  color: colorScheme.onBackground,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: const Icon(Icons.percent_sharp),
                  hintText: "Enter Your Vote",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: colorScheme.onBackground, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusColor: colorScheme.onBackground,
                )),

            const SizedBox(height: 20),
            SizedBox(
              width: width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Vote'),
              ),
            ),
            // simple text field with % icon for puting percentage of reserve
          ],
        )));
  }
}
