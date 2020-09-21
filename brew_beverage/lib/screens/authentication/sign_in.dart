import 'package:brew_beverage/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dangnhap extends StatefulWidget {
  // We create it in a widget itself not the state object
  // because it is a constructor for a widget
  // We're passing the value into the widget itself not the state object
  final Function togglePage;
  Dangnhap({this.togglePage});
  @override
  _DangnhapState createState() => _DangnhapState();
}

class _DangnhapState extends State<Dangnhap> {
  //Create an instance of object Dichvuxacthuc to interact with
  final DichvuXacThuc _nguoidunghientai = DichvuXacThuc();
  //Text field state
  String email = '';
  String matkhau = '';
  String error = '';
  //define the key to check the input before send request to Firebase auth
  final _fromChiaKhoa = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Sign in'),
          backgroundColor: Colors.brown,
          actions: <Widget>[
            FlatButton.icon(onPressed: (){
              widget.togglePage();
            }
            , icon: Icon(
                  Icons.person,
                ),
                label: Text('Register')

            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              child:Form(
                key: _fromChiaKhoa,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    TextFormField(
                      onChanged: (giatri) // Because we must specify what happen
                      // when the FormField changes
                      {
                        //Every time user does something new in the FormField
                        //this function is triggered and get us "giatri" within that FormField
                        setState(() {
                          email = giatri;
                        });
                      },
                      validator: (giatri)
                      {
                        return (giatri.isEmpty)? 'Enter an Email':null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your Email',
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField( // this is used for the password
                      onChanged: (giatri){
                        setState(() {
                          matkhau =giatri;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Enter your password'
                      ),
                      validator: (giatri)
                      {
                        return (giatri.length<6)? 'Enter a password with more than 6 characters ': null;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      color: Colors.amber[100],
                      child: Text('Sign in',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      ),
                      onPressed: ()  async  // Because this take time to interact with FireBase
                      {
                        if(_fromChiaKhoa.currentState.validate())
                          {
                            //dynamic result = await _nguoidunghientai.
                          }
                      },
                    ),
                    SizedBox(height: 12.0,),
                    Text(error,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.red,
                    ),
                    )
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
