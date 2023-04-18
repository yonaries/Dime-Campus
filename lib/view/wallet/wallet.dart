import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'widgets/circle_icon_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colorScheme.surface,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // upper container
            Container(
              height: 250,
              width: width,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        // Text(
                        //   'Total Credit',
                        //   style: TextStyle(
                        //     color: colorScheme.onBackground,
                        //     fontSize: 16,
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        const Text(
                          '487.60',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '150.00 loan limit',
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleIconButton(
                            onPressed: () {},
                            text: "Buy",
                            icon: Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          CircleIconButton(
                            onPressed: () {},
                            text: 'Send',
                            icon: Icons.arrow_upward,
                            color: const Color(0xFFb2d0ce),
                          ),
                          CircleIconButton(
                            onPressed: () {},
                            text: 'Receive',
                            icon: Icons.arrow_downward,
                            color: colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // plans container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'My Plans',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            Text(
                              'View all',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return SmallPlanCard(
                            colorScheme: colorScheme,
                            budget: 100,
                            category: 'savings',
                            current: 75,
                            title: 'Plan 1',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallPlanCard extends StatelessWidget {
  const SmallPlanCard({
    super.key,
    required this.colorScheme,
    required this.title,
    required this.category,
    required this.current,
    required this.budget,
  });

  final ColorScheme colorScheme;
  final String title;
  final String category;
  final int current;
  final int budget;

  @override
  Widget build(BuildContext context) {
    final double percent = (current / budget) * 100;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            LinearPercentIndicator(
              width: 120.0,
              lineHeight: 8.0,
              animation: true,
              animationDuration: 1000,
              leading: Text(
                current.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                budget.toString(),
                style: TextStyle(color: colorScheme.onSurface),
              ),
              percent: percent / 100,
              barRadius: const Radius.circular(50),
              progressColor: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
