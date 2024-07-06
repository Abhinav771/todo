import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController _email=TextEditingController();
  reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
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
        
            ElevatedButton(onPressed: (()=>reset()), child: Text('Send Link')),
          ],),
        ),
      ),
    );
  }
}
