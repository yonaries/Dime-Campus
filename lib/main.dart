import 'package:flutter/material.dart';
import 'package:nuvio/core/common/QrWidget.dart';
import 'package:nuvio/view/Qr/qr.dart';
import 'package:nuvio/view/intro/intro.dart';
import 'package:nuvio/view/qr/my_qr.dart';

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
        initialRoute: '/my_qr',
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Dime App'));
            case '/scan':
              return MaterialPageRoute(builder: (context) => const QrView());

            case '/intro':
              return MaterialPageRoute(builder: (context) => const IntroView());
            case '/test':
              return MaterialPageRoute(
                  builder: (context) => QrWidget("dsdsdsd"));
            case '/my_qr':
              return MaterialPageRoute(
                  builder: (context) =>
                      MyQr("dsdsdsdsdsds", "dsdsd", "dsdsd", "dsdsd"));
            default:
              return MaterialPageRoute(builder: (context) => QrView());
          }
          // case '/my_qr': (context){

          //   }
        }
        // routes: {
        //   '/home': (context) => const MyHomePage(title: 'Dime App'),
        //   '/scan': (context) => const QrView(),
        //   '/intro': (context) => IntroView(),
        //   '/test': (context) => QrWidget("Ebenezer"),
        //   '/my_qr': (context){
        //        final args = context

        //   };
        // },
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
