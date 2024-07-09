

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

        child: Center(


          child: SizedBox(
            width: 300,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('LOGIN',style: TextStyle(fontSize: 50,fontFamily: 'OpenSans',fontWeight: FontWeight.w500),),
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
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Enter Password'),

                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(onPressed: (()=>signIn()), child: Text('Login',style: TextStyle(fontSize: 16),),

                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Rounded corners
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Not have Account? '),
                  TextButton(onPressed:()=>Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp())),
                      child: Text('Register.')),
                ],),
                  Row(
                    children: [
                      TextButton(onPressed:()=>Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forgot())),
                          child: Text('Forgot Password?')),
                    ],
                  ),
                  SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: 2,
                      width: 80,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: Text('OR',style: TextStyle(fontSize: 10,fontFamily: 'OpenSans'),),
                    ),
                    Container(
                      height: 2,
                      width: 80,
                      color: Colors.grey,
                    ),
                  ],
                ),
                  // SizedBox(height: ,),




                SizedBox(height: 15,),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(onPressed: (()=>loginGoogle()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Image.asset('images/google-icon.webp',height: 30,),
                        ),
                        Text('Login with Google',
                          style: TextStyle(fontSize: 16),),

                      ],),

                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                      ),
                    ),
                  ),





                // ElevatedButton(onPressed: (()=>loginGoogle()), child: Text('Login with gogle')),
                // ElevatedButton(onPressed: (()=>Get.to(SignUp())), child: Text('Register')),
                // ElevatedButton(onPressed: (()=>Get.to(Forgot())), child: Text('Forgot Password?')),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
