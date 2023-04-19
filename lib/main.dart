import 'package:flutter/material.dart';

import 'package:nuvio/core/common/QrWidget.dart';
import 'package:nuvio/view/Qr/qr.dart';
import 'package:nuvio/view/deposit/deposit.dart';
import 'package:nuvio/view/intro/intro.dart';
import 'package:nuvio/view/intro/intro_final.dart';
import 'package:nuvio/view/passcode/change_passcode.dart';
import 'package:nuvio/view/passcode/enter_passcode.dart';
import 'package:nuvio/view/qr/my_qr.dart';
import 'package:nuvio/view/plans/plans.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nuvio/view/rec/rec.dart';
import 'package:nuvio/view/send/send.dart';
import 'package:nuvio/view/withdrawal/with.dart';

import 'core/common/home.dart';
import 'core/common/keypad.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dbPath = (await getApplicationDocumentsDirectory()).path;
  Hive.init(dbPath);
  await Hive.openBox('main');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _box = Hive.box('main');

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
        initialRoute:
            '/home', //_box.containsKey('password') ? '/enter_pass' : '/intro',

        //white surface background onBackground
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case '/enter_pass':
              return MaterialPageRoute(builder: (context) => EnterPasscode());
            case '/change_pass':
              return MaterialPageRoute(builder: (context) => ChangePasscode());
            case '/withdraw':
              return MaterialPageRoute(builder: (context) => WithdrawView());
            case '/deposit':
              return MaterialPageRoute(builder: (context) => DepositView());
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
            case '/intro_f':
              return MaterialPageRoute(
                  builder: (context) => const IntroFinal());
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
