import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/login.dart';
import 'package:todo/screens/verify.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              // if(snapshot.data!.emailVerified){
              //   return MyApp();
              // }
              // else{
              //   return VerifyMail();
              // }
              print(snapshot.data);
              return MyApp();

            }
            else{
              return Login();
            }
          }
          
        ),
    );
  }
}
