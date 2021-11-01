import 'package:flutter/material.dart';
import 'package:resolvers/Screens/Analytics/AnalyticsPage.dart';
import 'package:resolvers/Screens/AuthScreens/AboutPage.dart';
import 'package:resolvers/Screens/AuthScreens/LogInScreen.dart';
import 'package:resolvers/Screens/HomeScreen.dart';
import 'package:resolvers/Screens/MyProfile/MyProfileScreen.dart';
import 'package:resolvers/Screens/Onboarding/Onboarding2.dart';
import 'package:resolvers/Screens/Onboarding/Onboarding3.dart';
import 'package:resolvers/Screens/Onboarding/Onboarding4.dart';
import 'package:resolvers/Screens/WandPages/BudgetScore.dart';
import 'Routes.dart';
import 'Screens/AuthScreens/SignUpScreen.dart';
import 'Screens/Onboarding/Onboarding1.dart';
import 'Services/SharedPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await getToken(key: "token1");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: token == null ? OnboardingOne() : HomePage(),
    /*SignUpPage(title: 'Flutter Demo Home Page'),*/
    routes: routes,
    initialRoute: token == null ? "/OnboardingOne" : "/HomePage",
  ));
}

var routes = <String, WidgetBuilder>{
  Routes.SignUpPage: (BuildContext context) => SignUpPage(),
  Routes.LogInPage: (BuildContext context) => LoginPage(),
  Routes.MyProfilePage: (BuildContext context) => MyProfile(),
  Routes.HomePage: (BuildContext context) => HomePage(),
  Routes.OnboardingPag1: (BuildContext context) => OnboardingOne(),
  Routes.OnboardingPage2: (BuildContext context) => OnboardingTwo(),
  Routes.OnboardingPage3: (BuildContext context) => OnBoardingThree(),
  Routes.OnboardingPage4: (BuildContext context) => OnboardingFour(),
  Routes.aboutPage: (BuildContext context) => AboutPage(),
  Routes.analyticsPage: (BuildContext context) => AnalyticsPage(),
  Routes.budgetScorePage: (BuildContext context) => BudgetScore(),
};
