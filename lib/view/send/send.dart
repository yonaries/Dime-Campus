import 'package:flutter/material.dart';
import 'package:nuvio/core/common/keypad.dart';

import '../../core/common/address.dart';

class Send extends StatefulWidget {
  Send({super.key});
  final TextEditingController _cnt = TextEditingController();

  @override
  State<Send> createState() => _SendState(KeyPad(_cnt), _cnt);
}

class _BottomSheet extends StatefulWidget {
  const _BottomSheet({super.key});

  @override
  State<_BottomSheet> createState() => __BottomSheetState();
}

class __BottomSheetState extends State<_BottomSheet> {
  String? _selectedDrop = null;
  static const _textStyle = TextStyle(fontSize: 30, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final _inputTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.onBackground);
    final size = MediaQuery.of(context).size;
    final _items = ['Food', "Other", "Dates :)"]
        .map((data) => DropdownMenuItem(
              value: data,
              child: Text(
                data,
                style: _textStyle.copyWith(fontSize: 8, color: Colors.black),
              ),
            ))
        .toList();
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.9,
              height: 50,
              child: InputDecorator(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Select a plan",
                    hintStyle: _textStyle.copyWith(fontSize: 10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(

                      // disabledHint: null,
                      isExpanded: true,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      hint: Text(
                        "Select a plan",
                        style: _textStyle.copyWith(fontSize: 8),
                      ),
                      value: _selectedDrop,
                      items: _items,
                      onChanged: (i) {
                        setState(() {
                          _selectedDrop = i;
                        });
                      }),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Remark",
                  style: _inputTextStyle,
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintStyle: _inputTextStyle,
                          border: const OutlineInputBorder(),
                          hintText: 'Type your reasons here'),
                    )),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.9, 50),
                    backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () {},
                child: const Text("Finish")),
          ]),
    );
    ;
  }
}

class _SendState extends State<Send> {
  static const _textStyle = TextStyle(fontSize: 30, color: Colors.white);
  String _ammt = "0";
  final TextEditingController _cnt;
  final KeyPad _keypad;

  _SendState(this._keypad, this._cnt);

  _showConfirm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const _BottomSheet();
        });
  }

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
            "send",
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
                  flex: 2,
                  child: Address(
                      "Nabrolx",
                      "7gb9od3b93dbn3pdneyv39vodn",
                      SizedBox(),
                      Text(
                        "To",
                        style: TextStyle(color: Colors.white),
                      ))),
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
                onPressed: () {
                  _showConfirm(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(size.width * 0.9, 50)),
                child: const Text("Send Credit"),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 1,
                  )),
            ],
          );
        }));
  }
}
