import 'package:flutter/material.dart';

class MyQr extends StatefulWidget {
  MyQr(
    this._myQr,
    this._myName,
    this._myHash,
    this._myAmmount, {
    super.key,
  });
  final String _myQr;
  final String _myName;
  final String _myHash;
  final String _myAmmount;

  @override
  State<MyQr> createState() => _MyQrState(_myQr, _myHash, _myHash, _myAmmount);
}

class _MyQrState extends State<MyQr> {
  final String _myQr;
  final String _myName;
  final String _myHash;
  final String _myAmmount;
  _MyQrState(this._myQr, this._myName, this._myHash, this._myAmmount);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Qr code"),
        centerTitle: true,
      ),
    );
  }
}
