import 'package:flutter/material.dart';
import 'package:nuvio/view/Qr/qr.dart';

import 'core/common/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dime',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(0, 230, 118, 1),
            secondary: Color.fromRGBO(255, 224, 130, 1),
            error: Colors.redAccent),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHomePage(title: 'Dime App'),
        '/scan': (context) => const QrView()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}
