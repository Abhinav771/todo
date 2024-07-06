

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  bool isloading=false;

  signIn()async{
    setState(() {
      isloading=true;
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);

    }
    on FirebaseAuthException catch(e){
      Get.snackbar('Error Msg: ', e.code);
    }
    catch(e){
      Get.snackbar('Error Msg: ', e.toString());
    }
    setState(() {
      isloading=false;
    });

  }

  loginGoogle()async{
    final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;

    final credential =GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    await FirebaseAuth.instance.signInWithCredential(credential);
  }


  @override
  Widget build(BuildContext context) {
    return isloading? Center(child: CircularProgressIndicator(),):Scaffold(
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
            ElevatedButton(onPressed: (()=>loginGoogle()), child: Text('Login with gogle')),
            ElevatedButton(onPressed: (()=>Get.to(SignUp())), child: Text('Register')),
            ElevatedButton(onPressed: (()=>Get.to(Forgot())), child: Text('Forgot Password')),
          ],),
        ),
      ),
    );
  }
}
