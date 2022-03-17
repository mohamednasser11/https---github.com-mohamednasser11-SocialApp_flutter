import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_auth_app/resources/facebook_sign_in.dart';
import 'package:new_auth_app/resources/google_signin.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/sparks foundation logo.jpg"),
              backgroundColor: Colors.transparent,
              radius: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("The Social integration app",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Provider.of<GoogleSignin>(context, listen: false).googleLogin();
              },
              icon: const Icon(FontAwesomeIcons.google),
              label: const Text("Sign in with google"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black54,
                onPrimary: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Provider.of<FacebookSigninProvider>(context, listen: false)
                    .signInWithFacebook();
              },
              icon: const Icon(FontAwesomeIcons.facebookSquare),
              label: const Text("Sign in with facebook"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black54,
                onPrimary: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
          ],
        ),
      )),
    );
  }
}
