import 'package:brew_beverage/services/auth.dart';
import 'package:flutter/material.dart';

class Dangky extends StatefulWidget {
  final Function togglePage;
  Dangky({this.togglePage});
  @override
  _DangkyState createState() => _DangkyState();
}

class _DangkyState extends State<Dangky> {
  String email  = '';
  String matkhau = '';
  String matkhau2 = ''; // This used to check the password twice
  String error = '';
  // define a key to check to info before send request to Firebase Auth
  final _formChiaKhoa = GlobalKey<FormState>();
  final DichvuXacThuc _nguoidunghientai = DichvuXacThuc();
  @override
  // Text Form state
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Sign up'),
          backgroundColor: Colors.brown,
          actions: <Widget>[
            FlatButton.icon(onPressed: (){
              widget.togglePage();
              // we cannot use this.togglePage because this prefer to the state widget
            }
                , icon: Icon(
                  Icons.person,
                ),
                label: Text('Sign in ')

            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
                child:Form(
                  key: _formChiaKhoa, // It created a global key and keep track of our form and the state of our from
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Please enter your Email',
                          icon: Icon(
                            Icons.email
                          )
                        ),
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
                         return (giatri.isEmpty) ? 'Enter an Email': null;
                        },
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField( // this is used for the password
                        decoration: InputDecoration(
                          labelText: 'Please enter your password',

                        ),
                        onChanged: (giatri){
                          setState(() {
                            matkhau =giatri;
                          });
                        },
                        validator: (giatri)
                        {
                          return (giatri.length<6)? 'Please enter more than 6 characters ': null;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        onChanged: (giatri)
                        {
                          setState(() {
                            matkhau2 = giatri;
                          });
                        },
                        obscureText: true,
                        validator: (giatri)
                        { // Check if the entered password is the same with the previous one
                          return (matkhau != matkhau2)?  'Please check your password again! ':null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Please type your password again',
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        color: Colors.amber[100],
                        child: Text('Register',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: ()  async  // Because this take time to interact with FireBase
                            {
                              if(_formChiaKhoa.currentState.validate())
                                {
                                  dynamic result =  await _nguoidunghientai.dangNhapvoiEmailvaMatkhau(email, matkhau);
                                  if(result==null)
                                    {
                                      setState(() {
                                        error = 'Please enter valid Email';
                                      });
                                    }
                                }
                            },
                      ),
                      SizedBox(height: 12.0,),
                      Text(error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0
                      ),)
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
