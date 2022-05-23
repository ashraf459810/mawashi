import 'package:dellyshop/constant.dart';
import 'package:dellyshop/screens/login/login_screen.dart';
import 'package:dellyshop/screens/register/register_screen.dart';
import 'package:dellyshop/widgets/carousel_pro.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  AnimationController animationController;
  var tapLogin = 0;
  var tapSignup = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: new Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              animationDuration: Duration(milliseconds: 300),
              dotSize: 0.0,
              dotSpacing: 16.0,
              dotBgColor: Colors.transparent,
              showIndicator: false,
              overlayShadow: false,
              images: [
                AssetImage('assets/images/shopper1.jpg'),
                AssetImage("assets/images/shopper2.jpg"),
                AssetImage('assets/images/shopper3.jpg'),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,

            /// Set gradient color in image (Click to open code)
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromRGBO(0, 0, 0, 0.3),
                  Color.fromRGBO(0, 0, 0, 0.7)
                ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),

            /// Set component layout
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    "assets/images/DellyLogo.png",
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Text(
                      ApplicationLocalizations.of(context)
                          .translate('splash_desc'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                          fontSize: kSubTitleFontSize),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 150.0)),
                  ButtonCustom(
                    txt: ApplicationLocalizations.of(context)
                        .translate('sign_up'),
                    bacgroudColor: Colors.transparent,
                    textColor: kWhiteColor,
                    ontap: () {
                      Navigator.of(context)
                          .pushNamed((RegisterScreen.routeName));
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /// To set white line (Click to open code)
                      Container(
                        color: Colors.white,
                        height: 0.2,
                        width: 80.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),

                        /// navigation to home screen if user click "OR SKIP" (Click to open code)
                        child: Text(
                          ApplicationLocalizations.of(context)
                              .translate('or_skip'),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Poppins",
                              fontSize: 15.0),
                        ),
                      ),

                      /// To set white line (Click to open code)
                      Container(
                        color: Colors.white,
                        height: 0.2,
                        width: 80.0,
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  ButtonCustom(
                    txt: ApplicationLocalizations.of(context)
                        .translate('sign_in'),
                    bacgroudColor: Colors.transparent,
                    textColor: kWhiteColor,
                    ontap: () {
                      Navigator.of(context).pushNamed((LoginScreen.routeName));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initState() {
    // TODO: implement initState
    /// Animation proses duration
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tapLogin = 0;
                tapSignup = 0;
              });
            }
          });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _Playanimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }
}
