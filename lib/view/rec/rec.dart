import 'package:flutter/material.dart';

import '../../core/common/keypad.dart';

class RecieveView extends StatefulWidget {
  RecieveView({super.key});
  TextEditingController _cnt = TextEditingController(text: "0");
  @override
  State<RecieveView> createState() => _RecieveViewState(KeyPad(_cnt), _cnt);
}

class _RecieveViewState extends State<RecieveView> {
  static const _textStyle = TextStyle(fontSize: 30, color: Colors.white);
  final TextEditingController _cnt;
  _RecieveViewState(this._keypad, this._cnt);
  String _ammt = "0";
  KeyPad _keypad;

  @override
  void initState() {
    super.initState();
    _cnt.addListener(() {
      setState(() {
        _ammt = _cnt.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text(
            "Receive",
          ),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 1,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    _ammt,
                    style: _textStyle,
                  )),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 1,
                  )),
              Expanded(flex: 17, child: _keypad),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 1,
                  )),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    minimumSize: Size(size.width * 0.9, 50)),
                child: const Text(
                  "Receive Credit",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 1,
                  )),
            ],
          );
        }));
    ;
  }
}
