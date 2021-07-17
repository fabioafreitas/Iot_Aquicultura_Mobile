import 'package:flutter/material.dart';

class TextButtonCustom extends StatefulWidget {
  var textMessage;
  var textButton;
  var navigationRoute;

  TextButtonCustom(
      {Key? key,
      @required this.textMessage,
      @required this.textButton,
      @required this.navigationRoute})
      : super(key: key);

  @override
  _TextButtonCustomState createState() => _TextButtonCustomState();
}

class _TextButtonCustomState extends State<TextButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.textMessage),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, widget.navigationRoute),
          child: Text(widget.textButton),
        ),
      ],
    );
  }
}
