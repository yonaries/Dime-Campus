import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QrWidget extends StatefulWidget {
  final String _forData;
  const QrWidget(this._forData, {super.key});

  @override
  State<QrWidget> createState() => _QrWidgetState(this._forData);
}

class _QrWidgetState extends State<QrWidget> {
  final String _forData;
  _QrWidgetState(this._forData);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            //   padding: EdgeInsets.all(10),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: QrImage(data: _forData))),
      ),
    );
  }
}
