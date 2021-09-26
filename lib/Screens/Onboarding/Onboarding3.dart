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
          padding: EdgeInsets.only(top: height*0.05,left: 0.03*width,right: 0.03*width),
          child: Column(
            children: [
              Image.asset("assets/BudgetAI_Logo.png",height: height*0.08,width: width*0.3,),
              SizedBox(
                height: 0.02*height,
              ),
              Image.asset("assets/ob2.png",height: height*0.28,width: width*0.7,color:Colors.transparent,colorBlendMode: BlendMode.color,),
              SizedBox(
                height:  0.02*height,
              ),
              Text("Get questions answered!",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 34),textAlign: TextAlign.center,),
              SizedBox(
                height: 0.02*height,
              ),
              Text("Use our on of a kind AI to get answers to all your financial related questions.",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 20,color: Color(0xffd9b6ff)),textAlign: TextAlign.center,),
              SizedBox(
                height: 0.02*height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle,color: Colors.white,size: 10,),
                  SizedBox(width: 0.02*width,),
                  Icon(Icons.circle,color: Color(0xff39d074),size: 10,),
                  SizedBox(width: 0.02*width,),
                  Icon(Icons.circle,color: Colors.white,size: 10,)
                ],
              ),
              SizedBox(
                height: 0.14*height,
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Color(0xff39d074),
                        elevation: 20,
                        child: Container(
                          height: 0.08*height,
                          width: 0.20*width,
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
                          ),
                          child: Center(child: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                         // Navigator.pushNamed(context, Routes.OnboardingPage4);
                        Navigator.of(context).push(createRoute(OnboardingFour()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        color: Color(0xff39d074),
                        elevation: 20,
                        child: Container(
                          height: 0.08*height,
                          width: 0.20*width,
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
                          ),
                          child: Center(child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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