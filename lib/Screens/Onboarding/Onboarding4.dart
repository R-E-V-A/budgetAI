import 'package:flutter/material.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';

import '../../Routes.dart';

class OnboardingFour extends StatefulWidget {
  const OnboardingFour({Key key}) : super(key: key);

  @override
  _OnboardingFourState createState() => _OnboardingFourState();
}

class _OnboardingFourState extends State<OnboardingFour> {
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
          padding: EdgeInsets.only(top: height*0.05,left: 0.05*width,right: 0.05*width),
          child: Column(
            children: [
              Image.asset("assets/BudgetAI_Logo.png",height: height*0.08,width: width*0.3,),
              SizedBox(
                height: 0.02*height,
              ),
              Image.asset("assets/ob2.png",height: height*0.28,width: width*0.7,color:Colors.transparent,colorBlendMode: BlendMode.color,),
              SizedBox(
                height: 0.02*height,
              ),
              Text("Enjoy your financial freedom  🎉",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 30),textAlign: TextAlign.center,),
              SizedBox(
                height: 0.06*height,
              ),
              Text("Achieve your financial goal, live the life you dream about. Start Saving Today!",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xffd9b6ff)),textAlign: TextAlign.center,),
              SizedBox(
                height: 0.02*height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle,color: Colors.white,size: 10,),
                  SizedBox(width: 0.02*width,),
                  Icon(Icons.circle,color: Colors.white,size: 10,),
                  SizedBox(width: 0.02*width,),
                  Icon(Icons.circle,color: Color(0xff39d074),size: 10,)
                ],
              ),
              SizedBox(
                height: 0.15*height,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/SignUpPage', (Route<dynamic> route) => false);
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
                        Text("Start Saving Now ",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),),
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
