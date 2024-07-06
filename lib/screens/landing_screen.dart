import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/wrapper.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void _endWelcomePage(context){
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_)=>Wrapper())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: IntroductionScreen(
            showNextButton: true,
            showSkipButton: true,
            showDoneButton: true,
            showBottomPart: true,
            next:Icon(Icons.navigate_next),
            skip: Text('Skip'),
            done: Text('Done'),
            onDone: (){
              _endWelcomePage(context);
            },
            // onSkip: (){
            //
            // },
            pages: [
              PageViewModel(
                bodyWidget: Center(
                  child:Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height:80,),
                        Image.asset('images/landing_screen_1.jpg',width: 500),
                        SizedBox(height:30,),
                        Text("Get Things Done. Effortlessly.",style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 25,
                        ),),
                      ],
                    ),
                  )
                ),
                title: "Page 1",
        
                // footer: Text('Footer'),
                decoration: PageDecoration(
                  pageColor: Colors.white,
                )
              ),
              PageViewModel(
                  bodyWidget: Center(
                      child:Container(
                        child: Column(
                          children: [
                            SizedBox(height:80,),
                            Image.asset('images/landing_screen_2.jpg',width: 500),
                            SizedBox(height:30,),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Stop Feeling Overwhelmed. Start Getting Organized.\n',
                                    style: TextStyle(color: Colors.black, fontSize: 25,fontFamily: "OpenSans",),
                                  ),

                                ],
                              ),),
                          ],
                        ),
                      )
                  ),
                  title: "Page 2",

                  // footer: Text('Footer'),
                  decoration: PageDecoration(
                    pageColor: Colors.white,
                  )
              ),
              PageViewModel(
                  bodyWidget: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height:80,),
                        Image.asset('images/landing_screen_3.jpg',width: 500),
                        SizedBox(height:30,),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Finally, a To-Do List That Works for You.\n',
                                style: TextStyle(color: Colors.black, fontSize: 25,fontFamily: "OpenSans"),
                              ),

                            ],
                          ),),


                      ],
                    ),
                  ),
                  title: "Page 3",

                  // footer: Text('Footer'),
                  decoration: PageDecoration(
                    pageColor: Colors.white,
                  )
              ),
            ],
          
          ),
        ),
      ),
    );
  }
}
