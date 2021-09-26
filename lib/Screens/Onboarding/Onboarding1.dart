import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Routes.dart';
import 'package:resolvers/Screens/Onboarding/Onboarding2.dart';

import 'Onboarding3.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({Key key}) : super(key: key);

  @override
  _OnboardingOneState createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffa25deb),
              Color(0xff6f2dd9)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height*0.35),
          child: Column(
            children: [
              Image.asset("assets/BudgetAI_Logo.png",height: height*0.12,width: width*0.9,),
              SizedBox(
                height: 0.02*height,
              ),
              Text("Your own financial freedom is just a click away!",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 20,color: Color(0xffd9b6ff)),textAlign: TextAlign.center,),
              SizedBox(
                height: 0.02*height,
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.8),
                child: Image.asset("assets/hand.png",height: height*0.10,width: width*0.3,),
              ),
              SizedBox(
                height: 0.2*height,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: GestureDetector(
                  onTap: (){
                     // Navigator.pushNamed(context, Routes.OnboardingPage2);
                      Navigator.of(context).push(createRoute(OnboardingTwo()));
                  },
                  child: Container(
                    height: 0.08*height,
                    width: 0.75*width,
                    margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff68e89a),
                            Color(0xff39d074)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff6f2dd9),
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("How it works ",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),),
                        SizedBox(
                          width: 0.02*width,
                        ),
                        Icon(Icons.arrow_right_alt,color: Colors.white,size: 30,)
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
