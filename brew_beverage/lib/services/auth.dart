import 'package:brew_beverage/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DichvuXacThuc {
  // We create an instance of FirebaseAuth so that we could sign in, sign out
  // using this object's methods
  final FirebaseAuth _xacthuc = FirebaseAuth.instance;
  //Create an instance of NguoiDung using User
  NguoiDung _nguoidungfromUser(User temp) {
    return temp != null ? NguoiDung(uid: temp.uid) : null;
  }

  // Create authentication change user stream
  Stream<NguoiDung> get nguoidung // It is a getter so I used the get keyword
  {
    return _xacthuc
        .authStateChanges()
        .map((User temp) => _nguoidungfromUser(temp));
    //We return our custom user every time there is a change
  }

  // Sign in anonimously
  Future dangNhapAnDanh() async {
    try {
      UserCredential ketqua = await _xacthuc.signInAnonymously();
      User nguoidung = ketqua.user;
      return _nguoidungfromUser(nguoidung);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with Email and password
  // Register with Email and password
  // Sign out method
  Future dangXuat() async {
    try {
      return _xacthuc.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
