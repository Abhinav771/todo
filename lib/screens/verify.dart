import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/wrapper.dart';

class VerifyMail extends StatefulWidget {
  const VerifyMail({super.key});

  @override
  State<VerifyMail> createState() => _VerifyMailState();
}

class _VerifyMailState extends State<VerifyMail> {
  @override
  void initState() {
    // TODO: implement initState
    sendverifylink();
    super.initState();
  }

  sendverifylink()async{
    final user=FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) =>{
      Get.snackbar('Link Sent', 'A link has been sent to your email!',margin: EdgeInsets.all(30),snackPosition: SnackPosition.BOTTOM)
    });
  }

  reload()async{
    await FirebaseAuth.instance.currentUser!.reload().then((value)=>{Get.offAll(Wrapper())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Text('Open your mail and check verification link!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=>reload()),
        child: Icon(Icons.restart_alt),
      ),
    );
  }
}
