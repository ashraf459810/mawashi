import 'package:dellyshop/screens/register/register_screen.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:dellyshop/widgets/social_button.dart';
import 'package:dellyshop/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_localizations.dart';
import '../../../constant.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in layout (Click to open code)
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/sheep.jpeg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          /// Set gradient color in image (Click to open code)
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.2),
                Color.fromRGBO(0, 0, 0, 0.7)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),

          /// Set component layout
          child: ListView(
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.topCenter,
                    child: Column(
                      children: <Widget>[
                        /// padding logo
                        Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.padding.top + 40.0)),
                        Image(
                          image: AssetImage("assets/images/logo.png"),
                          height: 100.0,
                          width: 150.w,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: CustomTextFromField(
                            onChanged: (){},
                            icon: Icons.email,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)
                               ! .translate("email"),
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: CustomTextFromField(
                            onChanged: (){},
                            icon: Icons.lock,
                            ispassword: true,
                            placeHolder: ApplicationLocalizations.of(context)
                           !     .translate("password"),
                            inputType: TextInputType.text,
                          ),
                        ),
                        CutomTextButton(
                            ApplicationLocalizations.of(context)
                            !    .translate("not_have_account"), () {
                          Navigator.of(context)
                              .pushNamed((RegisterScreen.routeName));
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonCustom(
                          txt: ApplicationLocalizations.of(context)
                           !   .translate("sign_in"),
                          ontap: () {
                            Navigator.of(context).pushReplacementNamed(
                                CustomBottomNavigationBar.routeName);
                          },
                          bacgroudColor: kWhiteColor,
                          textColor: kAppColor,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        Text(
                          ApplicationLocalizations.of(context)!.translate("or"),
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 0.2,
                              fontFamily: 'Poppins',
                              fontSize: 17.0),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: socialButton(
                                  kFaceLoginButton,
                                  kFacebookColor,
                                  "assets/icons/icons8-facebook_f.png",
                                  kWhiteColor),
                            ),

                            /// ButtonCustomGoogle
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: socialButton(
                                  kGoogleLoginButton,
                                  kWhiteColor,
                                  "assets/icons/icons8-google.png",
                                  kLightBlackTextColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Set Animaion after user click buttonLogin
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
