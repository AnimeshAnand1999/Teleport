import 'package:flutter/material.dart';
import 'package:teleport/screens/authenticate/log_in.dart';
import 'package:teleport/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showRegister = false;

  void toggleView(){
    setState(() {
      showRegister = !showRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!showRegister){
      return LogIn(toggleView: toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  }
}
