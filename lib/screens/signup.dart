import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/wrapper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
    Get.offAll(Wrapper());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column
            (children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(hintText: 'Enter Email'),

              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(hintText: 'Enter Password'),
                obscureText: true,
              ),
              ElevatedButton(onPressed: (()=>signup()), child: Text('Sign Up')),
          ],),
        ),
      ),
    );
  }
}
