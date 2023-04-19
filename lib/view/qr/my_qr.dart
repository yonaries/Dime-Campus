import 'package:flutter/material.dart';
import 'package:nuvio/core/common/QrWidget.dart';
import 'package:nuvio/view/qr/qr.dart';

class MyQr extends StatefulWidget {
  MyQr(
    this._myName,
    this._myHash,
    this._myAmmount, {
    super.key,
  });

  final String _myName;
  final String _myHash;
  final String _myAmmount;

  @override
  State<MyQr> createState() => _MyQrState(_myName, _myHash, _myAmmount);
}

class _MyQrState extends State<MyQr> {
  final String _myName;
  final String _myHash;
  final String _myAmmount;
  _MyQrState(this._myName, this._myHash, this._myAmmount);
  String _hideHalf(String s) {
    List<String> newStr = s.split('');
    for (int i = newStr.length - 3; i >= 2; i--) {
      newStr[i] = '*';
    }
    return newStr.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Qr code"),
          centerTitle: true,
        ), //TODO change AppBar
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.4,
            )),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0x5B5B5B5B),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 20))),
                      leading: const SizedBox(),
                      subtitle: Text(
                        _hideHalf(_myHash),
                        style: const TextStyle(color: Colors.white30),
                      ),
                      trailing: Text(
                        "\$$_myAmmount",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      title: Text(
                        _myName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Flexible(
                child: FractionallySizedBox(
              heightFactor: 0.4,
            )),
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0x5B5B5B5B),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                        padding: EdgeInsets.all(24), child: QrWidget(_myHash))))
          ],
        ));
  }
}
