import 'package:brew_beverage/services/auth.dart';
import 'package:flutter/material.dart';

class Dangnhap extends StatefulWidget {
  @override
  _DangnhapState createState() => _DangnhapState();
}

class _DangnhapState extends State<Dangnhap> {
  //Create an instance of object Dichvuxacthuc to interact with
  final DichvuXacThuc _nguoidunghientai = DichvuXacThuc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Sign in'),
          backgroundColor: Colors.brown,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Container(
            child: RaisedButton(
              child: Text('Sign in anonymously'),
              onPressed: () async {
                // This is an async function because it will perform an async task
                dynamic ketquadangnhap =
                    await _nguoidunghientai.dangNhapAnDanh();
                if (ketquadangnhap == null) {
                  print('Error Sign in');
                } else {
                  print('User haved signed in ');
                  print(ketquadangnhap.uid);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
