import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_auth_app/resources/facebook_sign_in.dart';
import 'package:new_auth_app/resources/google_signin.dart';
import 'package:new_auth_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> GoogleSignin()),
          ChangeNotifierProvider(create: (context)=> FacebookSigninProvider()),
        ],
        builder: (context, child) {
          return  const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}
