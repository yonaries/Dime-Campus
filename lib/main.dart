import 'package:flutter/material.dart';

import 'package:nuvio/core/common/QrWidget.dart';
import 'package:nuvio/view/Qr/qr.dart';
import 'package:nuvio/view/intro/intro.dart';
import 'package:nuvio/view/qr/my_qr.dart';
import 'package:nuvio/view/plans/plans.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nuvio/view/rec/rec.dart';
import 'package:nuvio/view/send/send.dart';

import 'core/common/home.dart';
import 'core/common/keypad.dart';

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
          textTheme: GoogleFonts.interTextTheme(
            ThemeData.light().textTheme,
          ),
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(0, 230, 118, 1),
            secondary: Color.fromRGBO(255, 224, 130, 1),
            error: Colors.redAccent,
            background: Color(0xFF0b0d0f),
            surface: Color(0xFF101213),
            onSurface: Color(0xFFccd2e3),
            onBackground: Color(0xFF6a6a6a),
          ),
        ),

        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: '/rec', //white surface background onBackground
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/rec':
              return MaterialPageRoute(builder: (context) => RecieveView());
            case '/':
            case '/home':
              return MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Dime App'));
            case '/scan':
              return MaterialPageRoute(builder: (context) => const QrView());
            case '/send':
              return MaterialPageRoute(builder: (context) => Send());
            case '/plans':
              return MaterialPageRoute(
                  builder: (context) => const PlansScreen());
            case '/intro':
              return MaterialPageRoute(builder: (context) => const IntroView());
            case '/test':
              return MaterialPageRoute(builder: (context) => TestKeyPad());
            case '/my_qr':
              return MaterialPageRoute(
                  builder: (context) =>
                      MyQr("Nablox", "8ye3943nyd83y83hrndoenfjn", "20"));
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
