import 'package:brew_beverage/services/auth.dart';
import 'package:flutter/material.dart';

class TrangChu extends StatelessWidget {
  final DichvuXacThuc _auth = DichvuXacThuc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Hot beverage menu'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      await _auth.dangXuat();
                    },
                    icon: Icon(Icons.people),
                    label: Text('Logout'))
              ],
            ),
            backgroundColor: Colors.brown[50]));
  }
}
