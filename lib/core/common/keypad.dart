import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class TestKeyPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cnt = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.pink,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          flex: 1,
          child: TextField(
            controller: cnt,
            decoration: const InputDecoration(
                border: null,
                fillColor: Colors.white,
                focusColor: Colors.white),
          ),
        ),
        Expanded(flex: 1, child: KeyPad(cnt))
      ]),
    );
  }
}

class KeyPad extends StatelessWidget {
  final TextEditingController _cntrl;

  final List<String> _val = [];
  KeyPad(this._cntrl, {super.key});

  void _regChange(String s) {
    if (_val.length == 1 && _val[0] == '0') {
      _val.removeLast();
      _val.add(s);
      return;
    }
    debugPrintThrottled('old val $_val');
    if (s == '<') {
      if (_val.length == 0) return;
      _val.removeLast();
    } else {
      _val.add(s);
    }
    debugPrintThrottled('new val $_val');
    _cntrl.text = _val.join();
  }

  static const _textStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 25);

  @override
  Widget build(BuildContext context) {
    final List<String> _raw =
        ([for (int i = 1; i < 10; i++) i.toString()]).toList();
    _raw.addAll(['.', '0', '<']);
    final _btns = _raw.map((text) => TextButton(
          child: Text(
            text,
            style: _textStyle,
          ),
          onPressed: () {
            _regChange(text);
            debugPrintThrottled('Changed text ${_val.join()}');
          },
        ));
    return GridView.count(crossAxisCount: 3, children: List.from(_btns));
  }
}
