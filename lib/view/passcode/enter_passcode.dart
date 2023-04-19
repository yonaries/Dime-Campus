import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nuvio/core/common/keypad.dart';

class EnterPasscode extends StatefulWidget {
  EnterPasscode(this._pass, {super.key});
  final TextEditingController _cnt = TextEditingController();
  final String _pass;

  @override
  State<EnterPasscode> createState() =>
      _EnterPasscodeState(_cnt, KeyPad(_cnt), _pass);
}

class _EnterPasscodeState extends State<EnterPasscode> {
  _EnterPasscodeState(this._cnt, this._keyPad, this._passNeeded);
  bool _show = false;
  String _pass = "";
  final KeyPad _keyPad;
  final TextEditingController _cnt;
  final String _passNeeded;
  static const _textStyle = TextStyle(fontSize: 30, color: Colors.white);
  @override
  void initState() {
    super.initState();
    _cnt.addListener(() {
      setState(() {
        _pass = _cnt.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_pass == _passNeeded) {
      debugPrintThrottled("Got password");
    }
    final String pass = !_show ? ('*' * _pass.length) : _pass;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.3,
            )),
            Text(
              "Enter your passcode please",
              style: _textStyle.copyWith(fontSize: 15),
            ),
            ListTile(
              leading: const SizedBox(),
              title: Text(
                pass,
                style: _textStyle,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.remove_red_eye, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _show = !_show;
                  });
                },
              ),
            ),
            Expanded(flex: 4, child: _keyPad),
            Center(
              child: TextButton(
                  child: const Text("can not login ?"), onPressed: () {}),
            )
          ],
        ));
  }
}
