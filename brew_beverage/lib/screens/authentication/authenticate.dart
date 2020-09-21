import 'package:brew_beverage/screens/authentication/register.dart';
import 'package:brew_beverage/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';

class XacThuc extends StatefulWidget {
  @override
  _XacThucState createState() => _XacThucState();
}

class _XacThucState extends State<XacThuc> {
  bool showpage = true; // This will decide whether we show the register screen or
  // sign in screen
  void togglepage()
  {
    setState(() {
      showpage = !showpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return (showpage ==true) ? Dangnhap(togglePage: togglepage,) : Dangky(togglePage: togglepage,);
  }
}
