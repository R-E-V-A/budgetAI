import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Routes.dart';
import 'package:resolvers/Screens/Onboarding/Onboarding3.dart';

class OnboardingTwo extends StatefulWidget {
  const OnboardingTwo({Key key}) : super(key: key);

  @override
  _OnboardingTwoState createState() => _OnboardingTwoState();
}

class _OnboardingTwoState extends State<OnboardingTwo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: height*0.05,left: 0.03*width,right: 0.03*width),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.02*height,
                ),
                Image.asset("assets/untitled (5).png",height: height*0.48,width: width*0.7,color: Colors.transparent,colorBlendMode: BlendMode.multiply,),
                SizedBox(
                  height: 0.02*height,
                ),
                Text("Start your journey with fun learning content",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 30,color: Color(0xff0d0f44)),textAlign: TextAlign.center,),
                SizedBox(
                  height: 0.02*height,
                ),
                Text("explore various learning videos based on your passion",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff727587)),textAlign: TextAlign.center,),
                SizedBox(
                  height: 0.02*height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,color: Color(0xffa25deb),size: 10,),
                    SizedBox(width: 0.02*width,),
                    Icon(Icons.circle,color: Colors.grey,size: 10,),
                    SizedBox(width: 0.02*width,),
                    Icon(Icons.circle,color: Colors.grey,size: 10,),
                  ],
                ),
                SizedBox(
                  height: 0.02*height,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(createRoute(OnBoardingThree()));
                      // Navigator.pushNamed(context, Routes.OnboardingPage2);
                      // Navigator.of(context).push(createRoute(OnboardingThree()));
                    },
                    child: Container(
                      height: 0.08*height,
                      width: 0.75*width,
                      margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffa25deb),
                      ),
                      child: Center(child: Text("Continue",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
