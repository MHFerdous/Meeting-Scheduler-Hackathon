import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// don't touch this file, solved file

class AuthController {
  static String? accessToken,
      email0,
      fullName0,
      designation0,
      department0,
      countt;

  static String? accessToken1,
      email1,
      fullName1,
      studentId1,
      department1,
      count1,
      batch1,
      section1;

  static Future<void> setProfileDetails(String token, String email1,
      String fullName1, String designation1, String department1, String count,
      [String? batch, String? section]) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('email', email1);
    await sharedPreferences.setString('fullName', fullName1);
    await sharedPreferences.setString('designation', designation1);
    await sharedPreferences.setString('department', department1);
    await sharedPreferences.setString('count', count);
    accessToken = token;
    email0 = email1;
    fullName0 = fullName1;
    designation0 = designation1;
    department0 = designation1;
    countt = count;
  }

  static Future<void> setStudentProfileDetails(String token, String email2,
      String fullName2, String studentId2, String department2, String count2,
      [String? batch, String? section]) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('email', email2);
    await sharedPreferences.setString('fullName', fullName2);
    await sharedPreferences.setString('studentId', studentId2);
    await sharedPreferences.setString('department', department2);
    await sharedPreferences.setString('batch', batch!);
    await sharedPreferences.setString('section', section!);
    await sharedPreferences.setString('count', count2);
    accessToken1 = token;
    email1 = email2;
    fullName1 = fullName2;
    studentId1 = studentId2;
    department1 = department2;
    batch1 = batch;
    section1 = section;
    count1 = count2;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString('token');
    email0 = sharedPreferences.getString('email');
    fullName0 = sharedPreferences.getString('fullName');
    designation0 = sharedPreferences.getString('designation');
    department0 = sharedPreferences.getString('department');
    countt = sharedPreferences.getString('count');

    if (accessToken == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> checkStudentLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken1 = sharedPreferences.getString('token');
    email1 = sharedPreferences.getString('email');
    fullName1 = sharedPreferences.getString('fullName');
    studentId1 = sharedPreferences.getString('studentId');
    department1 = sharedPreferences.getString('department');
    batch1 = sharedPreferences.getString('batch');
    section1 = sharedPreferences.getString('section');
    count1 = sharedPreferences.getString('count');

    if (accessToken1 == null) {
      return false;
    } else {
      return true;
    }
  }

/*  static Future<void> clear() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAll(() => const FacSignInScreen());
  }

  static Future<void> clear2() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAll(() => const StuSignInScreen());
  }

  static Future<void> clearStu() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAll(() => const StuSignInScreen());
  }*/

// static bool get isLoggedIn {
//   return accessToken != null;
// }
}