import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_scheduler/application/app.dart';
import 'package:task_scheduler/presentation/state_holders/auth_controller.dart';
import 'package:task_scheduler/presentation/ui/screens/host_screens/host_auth/host_login_screen.dart';


class NetworkCaller {
  /// Api Get Method
  Future<dynamic> getMethod(String url,
      {Map<String, String>? body, VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'token': AuthController.token ?? ''
      });
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  /// Api Post Method
  Future<dynamic> postMethod(String url,
      {Map<String, String>? body, VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'application/json',
            'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzM3MzEzNTgsImRhdGEiOiJzb2Z0ZW5naGFzYW4yNUBnbWFpbC5jb20iLCJpYXQiOjE3MzM2NDQ5NTh9.wLteudoqi7R5T2kg_9F2SV9nvxtcxr1a1Se_jpUXCFA'
          },
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        } else {
          moveToLogin();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  /// Api delete Method
  Future<dynamic> deleteMethod(String url,
      {Map<String, String>? body, VoidCallback? onUnAuthorize}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'token': AuthController.token ?? ''
      });

      if (response.statusCode == 200 && jsonDecode(response.body)['status'] == 'success') {
        return true;
        //return true;
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      log('Error $e');
    }
  }

  Future<void> moveToLogin() async {
    await AuthController.clearData();
    Navigator.pushAndRemoveUntil(
        MeetingScheduler.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const HostLogInScreen()),
            (route) => false);
  }
}