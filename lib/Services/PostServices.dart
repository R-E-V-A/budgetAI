import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:resolvers/Models/ExistingUserModel.dart';
import 'package:resolvers/Models/NewUserModel.dart';
import 'package:resolvers/Services/SharedPreferences.dart';
class PostServices {
  Future<NewUser> createNewUser(String username, String email, String password, String dob) async
  {
    Uri uri = Uri.parse("https://api-balanced-epic.azurewebsites.net/api/auth/signup");
    var head = {
      "Content-Type":"application/json"
    };
    var user = {
      "username": username,
      "email": email,
      "password": password,
      "dob":dob
    };
    var response = await http.post(
      uri,
      headers: head,
      body: jsonEncode(user),
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("User Registered:");
      print(response.body);
      var x = jsonDecode(response.body);
      saveToken(saveKey: "token1",saveValue: x["token"]);
      Fluttertoast.showToast(msg: "User created successfully");
      return NewUser.fromJson(jsonDecode(response.body));
    }
    else {
      print(response.statusCode);
      print(response.body);
      Fluttertoast.showToast(msg: "Couldn't sign you up. Email or username already exists");
      return null;
    }
  }
  Future<ExistingUser> LogInUser(String username,String password)async
  {
    Uri uri = Uri.parse("https://api-balanced-epic.azurewebsites.net/api/auth/login");
    var user = {
      "username": username,
      "password": password
    };
    var head = {
      "Content-Type":"application/json"
    };
    var response = await http.post(
        uri,
        body: jsonEncode(user),
        headers: head
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("User LoggedIn:");
      print(response.body);
      Fluttertoast.showToast(msg:"User Logged In successfully");
      var x = jsonDecode(response.body);
      saveToken(saveKey: "token1",saveValue: x["token"]);
      /* saveUsername(saveKey:"username",saveValue: x["user"]["username"]);
      saveEmail(saveKey:"email",saveValue: x["email"]);*/
      return ExistingUser.fromJson(jsonDecode(response.body));
    }
    else {
      print(response.statusCode);
      print(response.body);
      Fluttertoast.showToast(msg: response.body);
      return null;
    }
  }
  Future<int>LogOutUser()async
  {
    String token =  await getToken(key:"token1");
    print("THIS IS LOGOUT TOKEN :$token");
    var headers = {
      "Authorization":"Token $token",
    };
    Uri uri = Uri.parse("https://api-balanced-epic.azurewebsites.net/api/logout/");
    var response =await http.post(uri,headers: headers);
    print("LOGGED OUT SUCCESS");
    print(response.statusCode);
    return response.statusCode;
  }
  Future<bool> addTransaction(String date, int amount, String category, String description, String type)
  async {
    String token = await getToken(key:"token1");
    Uri uri = Uri.parse("https://api-balanced-epic.azurewebsites.net/api/transaction");
    var user = {
      "Tdate":date,
      "amount":amount,
      "category":description,
      "description":category,
      "type":type
    };
    var head = {
      "Content-Type":"application/json",
      "Authorization":"Bearer $token"
    };
    var response = await http.post(
        uri,
        body: jsonEncode(user),
        headers: head
    );
    if(response.statusCode==200)
    {
      Fluttertoast.showToast(msg: "Transaction saved successfully");
      return true;
    }
    else
    {
      Fluttertoast.showToast(msg: response.body);
    }
    return false;
  }
  editProfilePic(String path)async
  {
    String token = await getToken(key: "token1");
    var headers = {
      "Authorization":"Token $token",
    };
    Uri uri = Uri.parse("https://api-balanced-epic.azurewebsites.net/api/profile-pic/");
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('profile',path));
    final response = await request.send();
    print(response.statusCode);
  }
}