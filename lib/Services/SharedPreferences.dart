import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveToken({String saveKey, String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}

Future<String>getToken({String key})async
{
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey)?? null;
  print("THIS IS TOKEN IN SPREF");
  print(value);
  return value;
}

Future<bool> saveUsername({String saveKey, String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}
Future<String>getUsername({String key})async
{
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey)?? null;
  print("THIS IS Username IN SPREF");
  print(value);
  return value;
}
Future<bool> saveEmail({String saveKey, String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}
Future<String>getEmail({String key})async
{
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey)?? null;
  print("THIS IS Email IN SPREF");
  print(value);
  return value;
}
deleteLocalKey(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final finalKey = '$key';
  prefs.remove(finalKey);
  prefs.clear();
}
Future<bool> savePic({String saveKey, String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}
Future<String>getPic({String key})async
{
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey)?? null;
  print("THIS IS Pic IN SPREF");
  print(value);
  return value;
}