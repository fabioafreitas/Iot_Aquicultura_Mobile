import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialNetworkButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _RoundedIconButton(
          icon: FontAwesomeIcons.facebookF,
          backgroundColor: Colors.indigo[900],
        ),
        _RoundedIconButton(
          icon: FontAwesomeIcons.twitter,
          backgroundColor: Colors.blue,
        ),
        _RoundedIconButton(
          icon: FontAwesomeIcons.google,
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}

class _RoundedIconButton extends StatelessWidget {
  var backgroundColor;
  var iconColor;
  var icon;

  _RoundedIconButton(
      {Key key,
      @required this.icon,
      @required this.backgroundColor,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: this.backgroundColor,
      child:
          FaIcon(this.icon, size: 35.0, color: this.iconColor ?? Colors.white),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}
