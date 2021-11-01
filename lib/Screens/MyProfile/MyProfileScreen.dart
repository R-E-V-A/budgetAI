import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Models/UserProfileModel.dart';
import 'package:resolvers/Screens/AuthScreens/Components/SignUpTextField.dart';
import 'package:resolvers/Services/GetServices.dart';
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
                  SizedBox(height: 0.03 * height,),
                  FutureBuilder<UserProfile>(
                    future: GetServices().getUserProfile(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                        {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(image:AssetImage("assets/profilepic.png"),
                                        fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.06*width,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Text(snapshot.data.username,style: paraText.copyWith(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 32),),
                                        Text(snapshot.data.email,style: paraText.copyWith(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 20)),
                                        SizedBox(height:0.01*height),
                                        GestureDetector(
                                          onTap: ()async{
                                          },
                                          child:Container(
                                            height: 0.04*height,
                                            width: width*0.3,
                                            margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Color(0xffa25deb),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Center(child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.edit,color: Colors.white,size: 20,),
                                                  SizedBox(
                                                    width: 0.02*width,
                                                  ),
                                                  Text("Edit Profile",style: paraText.copyWith(fontSize: 12,fontWeight: FontWeight.w600),),
                                                ],
                                              )),
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                                ],
                              ),
                              SizedBox(height: 0.5*height,),
                              GestureDetector(
                                onTap: ()async{
                                  await deleteLocalKey("token1");
                                  Navigator.of(context)
                                      .pushNamedAndRemoveUntil('/LogInPage', (Route<dynamic> route) => false);
                                },
                                child: Container(
                                  height: 0.07*height,
                                  width: width*0.8,
                                  margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xff200e32)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Log Out",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),),
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
                          );
                        }
                      return Center(child: Text("Hang On, Fetching your info"),);
                    }
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          currentIndex: currIndex,
          elevation: 20,
          onTap: (val) {
            setState(() {
              if (val != currIndex) {
                currIndex = val;
                if (val == 0) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/HomePage', (Route<dynamic> route) => false);
                } else if (val == 1) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/BudgetScorePage', (Route<dynamic> route) => false);
                } else if (val == 2) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/MyProfilePage', (Route<dynamic> route) => false);
                }
              }
            });
          },
          selectedIconTheme: IconThemeData(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
                label: "Fin AI",
                icon: Icon(Icons.mic)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
        )
    );
  }
}
