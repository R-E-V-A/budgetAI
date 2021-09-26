import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Screens/AuthScreens/Components/SignUpTextField.dart';
import 'package:resolvers/Services/PostServices.dart';
import 'package:resolvers/Services/SharedPreferences.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Routes.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String token;
  PageController pageController = PageController(
//    initialPage: 0,
    keepPage: true,
  );
 // final _picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(
              left: 0.06* width, right: 0.04 * width, top: 0.06 * height),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profile", style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.black),),
                  SizedBox(height: 0.07 * height,),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xff7165e3),
          backgroundColor: Colors.white,
          currentIndex: currIndex,
          elevation: 20,
          onTap: (val) {
            setState(() {
              if(val!=currIndex)
                {
                  currIndex = val;
                  if (val == 0) {
                    Navigator.pushNamed(context, Routes.HomePage);
                  }
                  else if (val == 1) {
                    Navigator.pushNamed(context, Routes.analyticsPage);
                  }
                }
            });
          },
          items: [
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.account_balance_wallet_outlined)),
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(
                label: " ",
                icon: Stack(
                  children: [
                    Image.asset("assets/purplenavy.png", height: 50,),
                    Positioned(
                        top: 13,
                        left: 13,
                        child: Image.asset("assets/wand.png", height: 25,))
                  ],
                )),
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.sticky_note_2_rounded)),
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.person)),
          ],
        )
    );
  }
}
