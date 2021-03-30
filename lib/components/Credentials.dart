import 'package:flutter/material.dart';

class Credentials extends StatefulWidget {
  var buttonName;

  Credentials({Key key, @required this.buttonName}) : super(key: key);

  @override
  CredentialsState createState() => CredentialsState();
}

class CredentialsState extends State<Credentials> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Email",
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.email),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Password",
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.lock),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  onPressed: () {}, child: Text(widget.buttonName))),
        ),
      ],
    );
  }
}
