import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? firstName, lastName, token, profilePic, mobile, email;

  static Future<void> saveUserData(String uEmail, String uToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', uToken);
    await sharedPreferences.setString('email', uEmail);
    token = uToken;
    email = uEmail;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    token = sharedPreferences.getString('token');
    email = sharedPreferences.getString('email');
  }

  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  static showBase64Image(base64Image){
    UriData? data = Uri.parse(base64Image).data;
    Uint8List myImage = data!.contentAsBytes();
    return myImage;
  }
}