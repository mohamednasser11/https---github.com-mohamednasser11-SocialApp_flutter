import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin with ChangeNotifier{
  final googleSignin = GoogleSignIn();
  final String res = "Google";

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin()async{
   final googleUser =  await googleSignin.signIn();
   if(googleUser == null){
     return;
   }
   _user = googleUser;
   final googleAuth = await googleUser.authentication;

   final creds = GoogleAuthProvider.credential(
     accessToken: googleAuth.accessToken,
     idToken: googleAuth.idToken
   );

   await FirebaseAuth.instance.signInWithCredential(creds); 
   
   notifyListeners();
  }

  Future googleLogout()async{
    await googleSignin.disconnect();
    FirebaseAuth.instance.signOut();
  }
}