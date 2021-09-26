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
              Image.asset("assets/ob2.png",height: height*0.28,width: width*0.7,color: Colors.transparent,colorBlendMode: BlendMode.multiply,),
              SizedBox(
                height: 0.02*height,
              ),
              Text("Take control of your money, today!",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 30),textAlign: TextAlign.center,),
              SizedBox(
                height: 0.02*height,
              ),
              Text("Use our powerful features like Analytics, Expense Optimizer to make budgeting fast & easy!",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xffd9b6ff)),textAlign: TextAlign.center,),
              SizedBox(
                height: 0.02*height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle,color: Color(0xff39D074),size: 10,),
                  SizedBox(width: 0.02*width,),
                  Icon(Icons.circle,color: Colors.white,size: 10,),
                  SizedBox(width: 0.02*width,),
                  Icon(Icons.circle,color: Colors.white,size: 10,)
                ],
              ),
              SizedBox(
                height: 0.14*height,
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.65),
                child: GestureDetector(
                  onTap: (){
                  //  Navigator.pushNamed(context, Routes.OnboardingPage3);
                    Navigator.of(context).push(createRoute(OnBoardingThree()));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
