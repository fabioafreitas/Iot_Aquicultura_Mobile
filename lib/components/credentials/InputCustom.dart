import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  var inputName;
  var inputIcon;

  InputCustom({Key? key, @required this.inputName, @required this.inputIcon})
      : super(key: key);

  @override
  _InputCustomState createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: widget.inputName,
          prefixIcon: IconButton(
            onPressed: () => {},
            icon: Icon(widget.inputIcon),
          ),
        ),
      ),
    );
  }
}
