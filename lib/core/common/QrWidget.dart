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
    return Container(
      color: Colors.white,
      child: Center(
        child: QrImage(data: _forData),
      ),
    );
  }
}
