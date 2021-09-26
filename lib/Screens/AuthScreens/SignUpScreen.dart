import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Services/PostServices.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Routes.dart';
import 'Components/SignUpTextFIeldMobile.dart';
import 'Components/SignUpTextField.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  PostServices postServices=PostServices();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xffF0F0F0),
        child: Padding(
          padding: EdgeInsets.only(top: 0.08*height,left: 0.1*width,right: 0.1*width),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Row(
                    children: [
                      Image.asset("assets/budgetsignup.png",width: 0.3*width,),
                      SizedBox(
                        width: 0.02*width,
                      ),
                      Stack(
                        children: [
                          Image.asset("assets/signupbackground.png",width: 0.12*width,),
                          Positioned(
                            left: 7,
                              top: 3,
                              child: Image.asset("assets/aisignup.png",width: 0.07*width,height: 0.05*height,)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.03*height,
                ),
                Text("But first, Lets setup your account!",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 30,color: Color(0xff49494f)),textAlign: TextAlign.center,),
                SizedBox(
                  height: 0.1*height,
                ),
                Text("Email",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff49494f)),),
                SizedBox(height: 0.01*height,),
                SignUpTextFieldMobile(width: width,height: height,controller: email,title: "rick@gmail.com",),
                SizedBox(height: 0.02*height,),
                Text("Username",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff49494f)),),
                SizedBox(height: 0.01*height,),
                SignUpTextFieldMobile(width: width,height: height,controller: username,title: "pickleRick007",),
                SizedBox(height: 0.02*height,),
                Text("Password",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff49494f)),),
                SizedBox(height: 0.01*height,),
                SignUpTextFieldMobile(width: width,height: height,controller: password,title: "Shh!",),
                SizedBox(height: 0.09*height,),
                GestureDetector(
                  onTap: ()async{
                    var x;
                    if(formKey.currentState.validate())
                      {
                        formKey.currentState.save();
                        x =  await postServices.createNewUser(username.text, email.text, password.text, "01/01/2000");
                      }
                  if(x!=null) {
                    Navigator.pushNamed(context, Routes.aboutPage);
                  }
                  },
                  child: Container(
                    height: 0.07*height,
                    width: width*0.8,
                    margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff68e89a),
                            Color(0xff39d074)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign Up",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),),
                          SizedBox(
                            width: 0.02*width,
                          ),
                          Icon(Icons.arrow_right_alt,color: Colors.white,size: 30,)
                        ],
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 0.02*height,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.LogInPage);
                  },
                  child: Container(
                    height: 0.07*height,
                    width: width*0.8,
                    margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff6f6f72),
                            Color(0xff49494f)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Past User? Log in",style: paraText.copyWith(fontSize: 20,fontWeight: FontWeight.w500),),
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
      ),
    );
  }
}



