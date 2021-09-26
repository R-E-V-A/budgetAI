import 'package:flutter/material.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';

import '../../Routes.dart';

class CommonAppBar extends StatefulWidget {
  const CommonAppBar({Key key}) : super(key: key);

  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: width*0.27,
      title: Row(
        children: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, Routes.NewsPage);
          }, child: Text("News",style: Theme.of(context).textTheme.bodyText2.merge(financeurText),)),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, Routes.CommunityPage);
          }, child: Text("Community",style: Theme.of(context).textTheme.bodyText2.merge(financeurText))),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, Routes.HomePage);
          }, child: Text("Home",style: Theme.of(context).textTheme.bodyText2.merge(financeurText))),
          TextButton(onPressed: (){}, child: Text("Resources",style: Theme.of(context).textTheme.bodyText2.merge(financeurText))),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, Routes.AboutPage);
          }, child: Text("About",style: Theme.of(context).textTheme.bodyText2.merge(financeurText)))
        ],
      ),
      actions: [
        Row(
          children: [
            Center(
              child: TextButton(
                onPressed: (){
                },
                child: Text(
                  "Log In",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .merge(financeurText)
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: 0.01*width,
            ),
            Container(
              height: 35,
              width: 0.06*width,
              decoration: BoxDecoration(
                color: Color(0xff7B78FE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextButton(
                  onPressed: (){
                  },
                  child: Text(
                    "Get Started",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .merge(financeurText)
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
      leading: Center(child: Text("Financeur",style: Theme.of(context).textTheme.headline4.merge(financeurText),)),
      leadingWidth: 160,
    );
  }
}
