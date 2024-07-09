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
        child: Center(
          child: SizedBox(
            width: 300,
            child: Form(
              child: Column
                (children: [
                  SizedBox(height: 80,),
                Text('SIGN UP',style: TextStyle(fontSize: 50,fontFamily: 'OpenSans',fontWeight: FontWeight.w500),),
                 SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(hintText: 'Enter Email'),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(hintText: 'Enter Password'),
                      obscureText: true,
                    ),
                  ),
                SizedBox(height: 30,),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(onPressed: (()=>signup()), child: Text('Sign Up',style: TextStyle(fontSize: 16),),

                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                    ),
                  ),
                ),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
