import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tervel_app/auth/login.dart';
import 'package:tervel_app/auth/register.dart';
import 'package:tervel_app/view/screen/home.dart';
import 'package:tervel_app/view/screen/onboarding_screen.dart';
import 'package:tervel_app/view/screen/splash_screen.dart';


const String signUp = '/sign-up-screen';
const String home = '/home-screen';
const String signIn = '/signIn-screen';
const String onborading = '/onborading-screen';
const String splash = '/splash-screen';
const String privacy = '/privacy-screen';
const String UserFormScr = '/UserFormScr';

List<GetPage> getPages = [
  GetPage(
    name: signUp,
    page: () => signUpScreen(),
  ),
  GetPage(
    name: home,
    page: () => Home(),
  ),
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: signIn,
    page: () => signInScreen(),
  ),
  GetPage(
    name: onborading,
    page: () => onboardingScreen(),
  ),

  // GetPage(
  //   name: privacy,
  //   page: () => privacyScreen(),
  // ),



];
