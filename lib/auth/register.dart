import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tervel_app/helper/auth_helper.dart';
import 'package:tervel_app/helper/route.dart';
import 'package:tervel_app/util/const/app_color.dart';
import 'package:tervel_app/util/style/images/images.dart';
import 'package:tervel_app/view/base/custom_form_field.dart';
import 'package:tervel_app/view/base/custom_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tervel_app/view/base/custombottom.dart';

class signUpScreen extends StatefulWidget {
  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _usenameController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _mobilenumbercontroller = TextEditingController();

  RxBool _value = false.obs;

  final _formKey = GlobalKey<FormState>();

  bool value = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28, top: 50),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Your\nAcc ount',
                          style: TextStyle(
                            fontSize: 33.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolor.primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Create Your acount and start your\njourny',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: Appcolor.secondaryHeaderColor,
                          ),
                        ),
                        customFormField(
                          hintText: 'Full name',
                          inputtype: TextInputType.name,
                          controlller: _fullnameController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-z]+$').hasMatch(value!)) {
                              return "Can't be correct";
                            }
                          },
                        ),
                        customFormField(
                          hintText: 'User name',
                          inputtype: TextInputType.name,
                          controlller: _usenameController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-z]+$').hasMatch(value!)) {
                              return "Can't be correct";
                            } else {
                              return null;
                            }
                          },
                        ),
                        customFormField(
                          hintText: 'E-mail address',
                          inputtype: TextInputType.emailAddress,
                          controlller: _emailcontroller,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value!)) {
                              return "Can't be empty";
                            }
                          },
                        ),
                        customFormField(
                          hintText: 'Mobile number',
                          inputtype: TextInputType.number,
                          controlller: _mobilenumbercontroller,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                    .hasMatch(value!)) {
                              return "Can't be empty";
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _passwordcontroller,
                            obscureText: value,
                            decoration: InputDecoration(
                                hintText: 'password',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        value = !value;
                                      });
                                    },
                                    icon: value == true
                                        ? FaIcon(
                                            FontAwesomeIcons.eyeSlash,
                                            size: 15,
                                            color: Colors.grey,
                                          )
                                        : FaIcon(FontAwesomeIcons.eye,
                                            size: 15, color: Colors.grey))),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*\W)")
                                      .hasMatch(value!)) {
                                return "Can't be correct r#AG!3c4";
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        coustombuttom('Create account', () {
                          if (_formKey.currentState!.validate()) {
                            final fullnamee = _fullnameController.text;
                            final usernamee = _usenameController.text;
                            final passwords = _passwordcontroller.text;
                            final emaill = _emailcontroller.text;
                            final phonee = _mobilenumbercontroller.text;

                            authHelper().register(fullnamee, usernamee,
                                passwords, emaill, phonee, context);
                          }
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          //weight center nayar jonno
                          alignment: Alignment.center,
                          child: Text(
                            '--OR--',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w200,
                              color: Appcolor.secondaryHeaderColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.google,
                              width: 40.w,
                              height: 40.h,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              Images.fb,
                              width: 40.w,
                              height: 40.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                                text: 'Already create account? ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                          color: Appcolor.Violetcolor,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(signIn);
                                        }),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
