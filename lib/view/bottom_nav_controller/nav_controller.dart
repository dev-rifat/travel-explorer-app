import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tervel_app/util/const/app_color.dart';
import 'package:tervel_app/util/const/app_string.dart';

class ButtomNavCtr extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;

  List _pages = [
    Container(
      width: 300,
      height: 300,
      color: Colors.red,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.green,
    ),
    Container(
      width: 300,
      height: 300,
      color: Colors.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 400),
        top: _drawer.value == false ? 0 : 100.h,
        bottom: _drawer.value == false ? 0 : 100.h,
        left: _drawer.value == false ? 0 : 100.w,
        right: _drawer.value == false ? 0 : -100.w,
        child: Container(

          // decoration: BoxDecoration(      color: Colors.blue,
          //   borderRadius: BorderRadius.circular(20)
          // ),
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Appcolor.Cardcolor,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  AppSting.APP_NAME,
                  style: TextStyle(color: Colors.black),
                ),
                leading: _drawer.value == false
                    ? IconButton(
                        onPressed: () {
                          _drawer.value =true;
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          _drawer.value = false;
                        },
                        icon: Icon(Icons.cancel,color: Colors.black,))),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => _currentIndex.value = value,
              currentIndex: _currentIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite')
              ],
            ),
            body: _pages[_currentIndex.value],
          ),
        ),
      ),
    );
  }
}
