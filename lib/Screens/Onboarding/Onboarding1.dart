import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffa25deb),
                    Color(0xff290352),
                  ],
                  end: Alignment.bottomRight,
                  begin: Alignment.topLeft
              )
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  height: 100,
                  image: AssetImage(
                      "assets/budgetlogo.png"
                  ),
                ),
                Image(
                  height: 80,
                  image: AssetImage(
                      "assets/budgettextlogo.png"
                  ),
                ),
                Text("By Reva",style: paraText.copyWith(fontWeight: FontWeight.w700,fontSize: 18),),
                SizedBox(height: 0.01*height,),
                Text("Your financial freedom",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 15,)),
                Text("starts today!",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 15,)),
                SizedBox(height: 0.35*height,),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(40),
                      color: Colors.white
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/OnboardingTwo', (Route<dynamic> route) => false);
                    },
                    child: Icon(
                      Icons.chevron_right_sharp,
                      size: 50,
                      color: Color(0xff230b34),
                    ),
                  ),
                )
              ],
            ),
          ))
      ),
    );
  }
}
