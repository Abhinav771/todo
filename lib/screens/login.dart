

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo/screens/forgot.dart';
import 'package:todo/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(children: [
            TextFormField(
              controller: _email,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Enter Password'),

            ),
            ElevatedButton(onPressed: (()=>signIn()), child: Text('Login')),
            ElevatedButton(onPressed: (()=>Get.to(SignUp())), child: Text('Register')),
            ElevatedButton(onPressed: (()=>Get.to(Forgot())), child: Text('Forgot Password')),
          ],),
        ),
      ),
    );
  }
}
