import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IntroFinal extends StatelessWidget {
  const IntroFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Image.asset("assets/images/intro_4.jpg"),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(0, 50)),
                    child: const Text("Create Account")),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        minimumSize: const Size(0, 50)),
                    child: const Text("Restore Account"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
