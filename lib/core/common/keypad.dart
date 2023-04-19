import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class KeyPad extends StatelessWidget{
  TextEditingController _cntrl;
  KeyPad(this._cntrl, {super.key});
  
  
  @override
  Widget build(BuildContext context){
    List<TextButton> _btns = [
                             for(int i=1;i<10;i++) 
                                TextButton(child: Text('$i'), onPressed: (){})
      ].toList()
     ;
    return GridView.count(crossAxisCount: 3, children: _btns);
      
  }
}
