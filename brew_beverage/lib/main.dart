import 'package:brew_beverage/models/user.dart';
import 'package:brew_beverage/screens/wrapper.dart';
import 'package:brew_beverage/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  //For Firebase services to be used  FlutterFire needs to be initialized
  //The initialization is async meaning you have to wait until
  //everything is complete
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<NguoiDung>.value(
      value: DichvuXacThuc()
          .nguoidung, //this used to specify the stream it listens to
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BaoGoi(),
      ),
    );
  }
}
