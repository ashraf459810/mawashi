
import 'dart:async';

import 'package:dellyshop/core/navigate/nav.dart';
import 'package:dellyshop/core/widgets/container.dart';
import 'package:dellyshop/screens/login/login_screen.dart';

import 'package:flutter/material.dart';



class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  AnimationController ?animationController;
  var tapLogin = 0;
  var tapSignup = 0;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), (){
      nav(context, LoginScreen());
    });
    return Scaffold(

      body:container(
 hight: MediaQuery.of(context).size.height,
        width: double.infinity,child: Image.asset('assets/images/slpash.jpg',fit: BoxFit.cover,))
  );}}