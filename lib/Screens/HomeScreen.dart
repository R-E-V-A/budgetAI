import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Models/AllTransactionModel.dart';
import 'package:resolvers/Routes.dart';
import 'package:resolvers/Screens/BudgetDiary/AddRecord.dart';
import 'package:resolvers/Screens/MyProfile/SingleGoalsPage.dart';
import 'package:resolvers/Services/GetServices.dart';
import 'package:resolvers/Services/PostServices.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionDetails> data;

  GetServices getServices = GetServices();
  Future<List<TransactionDetails>>getTransactionDetails() async
  {
    List<TransactionDetails> data = await getServices.getAllTransactionDetails();
    return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getTransactionDetails();
  }
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(left: 0.03*width,right: 0.04*width,top: 0.04*height),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.04*width),
                    child: Text("Budget Diary",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 28,color: Colors.black),),
                  ),
                  SizedBox(height: 0.03*height,),
                  Card(
                    shadowColor:Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    color: Colors.white,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text("Your Goals",style: paraText.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 25),),
                                SizedBox(height: 0.01*height,),
                                Text("Great work this week! You are close to reaching your goal",style: paraText.copyWith(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 12),textAlign: TextAlign.start,),
                                SizedBox(height: 0.01*height,),
                                FAProgressBar(
                                  currentValue: 65,
                                  displayText:"%",
                                  progressColor: Color(0xffa25deb),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleGoalsPage()));
                            },
                            child: Container(
                              width:40,
                              height:30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black),
                              child: Icon(Icons.arrow_forward,color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 0.03*height,),
                  Padding(
                    padding: EdgeInsets.only(left: 0.04*width),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sort By Date",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black)),
                        Padding(
                          padding:  EdgeInsets.only(right: 0.02*width),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddRecord()),
                              );
                            },
                            child: Container(
                              height: 0.05*height,
                              width: width*0.25,
                              margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffa25deb)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add,color: Colors.white,size: 16,),
                                    SizedBox(
                                      width: 0.02*width,
                                    ),
                                    Text("Add",style: paraText.copyWith(fontSize: 16,fontWeight: FontWeight.w600),),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<TransactionDetails>>(
                    future: getTransactionDetails(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.done)
                      {
                        if(snapshot.hasData)
                        {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              reverse: true,
                              itemBuilder: (context,index){
                                if(index==null)
                                {
                                  return Center(child: Text("Sorry, you don't have any transactions"),);
                                }
                                return ListTile(
                                  leading: snapshot.data[index].type=="Expense"?Container(
                                    width: 0.13*width,
                                    height: 0.07*height,
                                    decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Color(0xffffe5e6)
                                    ) ,
                                    child: Center(
                                      child: Image(image:AssetImage("assets/minus.png"))
                                    ),
                                  ):Container(
                                    width: 0.13*width,
                                    height: 0.07*height,
                                    decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Color(0xffd9ffe8)
                                    ) ,
                                    child: Center(
                                      child: Image(image:AssetImage("assets/add.png"))
                                    ),
                                  ),
                                  trailing: Text("\$" + snapshot.data[index].amount.toString(),style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff1d1b23))),
                                  title: Text(snapshot.data[index].category.toString(),style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                                  subtitle: Text(snapshot.data[index].description.toString(),style: paraText.copyWith(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xff263238)),),
                                );
                              });
                        }
                        return Center(child: Text("Sorry you don't have any transactions"));
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
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
