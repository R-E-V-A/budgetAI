import 'package:flutter/material.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Routes.dart';
import 'package:resolvers/Screens/Onboarding/Onboarding4.dart';

class OnBoardingThree extends StatefulWidget {
  const OnBoardingThree({Key key}) : super(key: key);

  @override
  _OnBoardingThreeState createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
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
                Image.asset("assets/image 6.png",height: height*0.48,width: width*0.7,color: Colors.transparent,colorBlendMode: BlendMode.multiply,),
                SizedBox(
                  height: 0.02*height,
                ),
                Text("Learn your passion level up your skill",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 30,color: Color(0xff0d0f44)),textAlign: TextAlign.center,),
                SizedBox(
                  height: 0.02*height,
                ),
                Text("Make yourself expert your skill by studying from mentors",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff727587)),textAlign: TextAlign.center,),
                SizedBox(
                  height: 0.02*height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,color: Colors.grey,size: 10,),
                    SizedBox(width: 0.02*width,),
                    Icon(Icons.circle,color: Color(0xffa25deb),size: 10,),
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
                      Navigator.of(context).push(createRoute(OnboardingFour()));
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
Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}