import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  var buttonName;
  var navigationRoute;

  ButtonCustom(
      {Key? key, @required this.buttonName, @required this.navigationRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, navigationRoute),
          child: Text(
            buttonName,
          ),
        ),
      ),
    );
  }
}
