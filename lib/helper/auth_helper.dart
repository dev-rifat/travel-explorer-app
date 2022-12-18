import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tervel_app/helper/route.dart';
import 'package:get/get.dart';
import 'package:tervel_app/util/const/app_color.dart';
import 'package:get_storage/get_storage.dart';


class authHelper {

  final box = GetStorage();
  Future register(name, userName, password, email, phone, context) async {
    var Url = 'http://datanapp.com/desh/Register.php';

    try {
      http.Response response = await http.post(Uri.parse(Url), body: {
        'fullname': name,
        'username': userName,
        'password': password,
        'email': email,
        'mobile': phone
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print(data['UserData']);

        box.write('UserData',data.hashCode);



        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(" ${data['message']}")));
        print('Register Ok');

        if (data['status'] == false) {
          Fluttertoast.showToast(
              msg: "${data['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Appcolor.secondaryHeaderColor,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (data['UserData'].hashCode != null) {
          Get.toNamed(home);
          print('Id done');
          Fluttertoast.showToast(
              msg: "${data['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Appcolor.disabledColor,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future logIn(userName, password, context) async {
    var Url = 'http://datanapp.com/desh/loginapi.php';

    try {
      http.Response response = await http.post(Uri.parse(Url), body: {
        'username': userName,
        'password': password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        box.write('UserData',data.hashCode);
        // box.write('UserData',data['UserData']);

        print(data['UserData']);
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(" ${data['message']}")));
        print('Register Ok');

        if (data['status'] == false) {
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(" ${data['message']}")));


          Fluttertoast.showToast(
              msg: "${data['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Appcolor.secondaryHeaderColor,
              textColor: Colors.white,
              fontSize: 16.0);


        } else if (data['UserData'].hashCode != null) {
          Get.toNamed(home);
          print('Id done');

          Fluttertoast.showToast(
              msg: "${data['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Appcolor.secondaryHeaderColor,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
