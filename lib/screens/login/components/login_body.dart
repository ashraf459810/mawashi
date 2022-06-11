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
  
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in layout (Click to open code)
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/4.SignIn.jpg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          /// Set gradient color in image (Click to open code)
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromRGBO(0, 0, 0, 0.2),
            //     Color.fromRGBO(0, 0, 0, 0.7)
            //   ],
            //   begin: FractionalOffset.topCenter,
            //   end: FractionalOffset.bottomCenter,
            // ),
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
        
                
                        SizedBox(
                          height: 300.h,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical:10.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            height: 50.h,
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
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            height: 50.h,
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
                          height: 50.h,
                          witdh: 250.w,
                          
                          txt: ApplicationLocalizations.of(context)
                           !   .translate("sign_in"),
                          ontap: () {
                            Navigator.of(context).pushReplacementNamed(
                                CustomBottomNavigationBar.routeName);
                          },
                          bacgroudColor: kWhiteColor,
                          textColor: Colors.white,
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
