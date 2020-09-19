import 'package:brew_beverage/models/user.dart';
import 'package:brew_beverage/screens/authentication/authenticate.dart';
import 'package:brew_beverage/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaoGoi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //This is us accessing the data from the provider
    // We specify that kind of data we need
    final currentUser = Provider.of<NguoiDung>(context);
    print(currentUser);
    // Return either home or authenticate widget
    return (currentUser == null) ? XacThuc() : TrangChu();
  }
}
