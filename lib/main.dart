import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Providers/ChatBotProvider.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:sporty_app/WelcomeScreen.dart';
import 'package:sporty_app/Home/HomeScreen.dart';
import 'package:sporty_app/Auth/LogIn/ForgetPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/LogInScreen.dart';
import 'package:sporty_app/Auth/LogIn/NewPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/VerificationCode.dart';
import 'package:sporty_app/Auth/SignUp/SignUpScreen.dart';
import 'package:sporty_app/Home/ProfileView/BookingHistory.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardInfo.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardsScreen.dart';
import 'package:sporty_app/Home/ProfileView/ProfileInformation.dart';
import 'package:sporty_app/Home/ProfileView/ProfileViewScreen.dart';
import 'package:sporty_app/Home/SportProducts/checkout/provider/provider_checkout.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_controller.dart';
import 'package:sporty_app/Home/TrainingProgram/training_programs/screen/provider_trainings.dart';

import 'Home/ProfileView/OrderHistory.dart';
import 'Home/ProfileView/OrderInformation.dart';
import 'Home/SportProducts/checkout/provider/provider_success.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await cacheHelper.init();
  dynamic welcome = cacheHelper.sharedPreferences.getBool("welcome");
  dynamic token = cacheHelper.sharedPreferences.getString("token");

  Widget widget;
  if(welcome == false){
    if(token!=null)
    {
      widget=HomePage(2);
    }else{
      widget=LogInScreen();
    }
  }else{
    widget=WelcomeScreen();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TrainingProvider>(create: (context,) => TrainingProvider()..fetchDataa() ),
    ChangeNotifierProvider<ProductProvider>(create: (context,) => ProductProvider()..fetchData()),
    ChangeNotifierProvider<CheckoutProvider>(create: (context,) => CheckoutProvider()..fetchDataa()),
    ChangeNotifierProvider<ShoppingProviderr>(create: (context,) => ShoppingProviderr()..createDatabase()),

    ChangeNotifierProvider<chatProvider>(create: (context,) => chatProvider()),
  ],
    child: MyApp(widget: widget) ,
  ));}

class MyApp extends StatefulWidget {
  Widget widget;
  MyApp({this.widget});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      routes: {
        WelcomeScreen.ROUTE_NAME: (context)=>WelcomeScreen(),
        SignUpScreen.ROUTE_NAME:(context)=>SignUpScreen(),
        LogInScreen.ROUTE_NAME:(context)=>LogInScreen(),
        ForgetPasswordScreen.ROUTE_NAME:(context)=>ForgetPasswordScreen(),
        VerificationCode.ROUTE_NAME:(context)=>VerificationCode(),
        NewPasswordScreen.ROUTE_NAME:(context)=>NewPasswordScreen(),
        HomePage.ROUTE_NAME:(context)=>HomePage(2),
        ProfileScreen.ROUTE_NAME:(context)=>ProfileScreen(),
        ProfileInformation.ROUTE_NAME:(context)=>ProfileInformation(),
        CreditCardsScreen.ROUTE_NAME: (context)=>CreditCardsScreen(),
        CreditCardInformation.ROUTE_NAME: (context)=>CreditCardInformation(),
        OrderHistory.ROUTE_NAME: (context)=>OrderHistory(),
        OrderInformation.ROUTE_NAME: (context)=>OrderInformation(),
        BookingHistory.ROUTE_NAME: (context)=>BookingHistory(),
      },
      // initialRoute: ForgetPasswordScreen.ROUTE_NAME,
      //welcome==true?WelcomeScreen.ROUTE_NAME:LogInScreen.ROUTE_NAME,
      home:  widget.widget,
     debugShowMaterialGrid: false,
    );
  }

}

