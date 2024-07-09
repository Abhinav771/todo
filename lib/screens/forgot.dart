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
        child: Center(
          child: SizedBox(
            width: 300,
            child: Form(
              child: Column
                (children: [
                SizedBox(height: 80,),
                Text('SEND LINK',style: TextStyle(fontSize: 50,fontFamily: 'OpenSans',fontWeight: FontWeight.w500),),
                SizedBox(height: 40,),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(hintText: 'Enter Email'),

                ),

                SizedBox(height: 30,),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(onPressed: (()=>reset()), child: Text('Send Link',style: TextStyle(fontSize: 16),),

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
