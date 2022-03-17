import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_auth_app/screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshot.hasError){
          return const Center(
            child: Text("Error"),
          );
        }else if(snapshot.hasData){
          return const HomeScreen();
        }else{
          return const LoginScreen();
        }
      }),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  bool google = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(""),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, icon: const Icon(FontAwesomeIcons.signOutAlt))
        ],
      ),
      body: Center(
        child:Container(
          width: MediaQuery.of(context).size.width*0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 50,
              backgroundImage: NetworkImage("${user.photoURL}"),),
              const SizedBox(height: 20,),
              Text("${user.displayName}"),
              const SizedBox(height: 20,),
              Text("${user.email}")
            ],
          ),
        ),
      ),
    );
  }
}