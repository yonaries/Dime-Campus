import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  String _hideHalf(String s) {
    List<String> newStr = s.split('');
    for (int i = newStr.length - 3; i >= 2; i--) {
      newStr[i] = '*';
    }
    return newStr.join();
  }

  final String _myName;
  final String _myHash;
  final Widget _suffix;
  final Widget _prefix;
  const Address(this._myName, this._myHash, this._suffix, this._prefix,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(10, 20))),
          leading: _prefix,
          subtitle: Text(
            _hideHalf(_myHash),
            style: const TextStyle(color: Colors.white30),
          ),
          trailing: _suffix,
          title: Text(
            _myName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
