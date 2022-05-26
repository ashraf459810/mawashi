import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/screens/login/login_screen.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:dellyshop/widgets/text_button.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
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
          image: AssetImage("assets/images/shopper2.jpg"),
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
                          image: AssetImage("assets/images/DellyLogo.png"),
                          height: 100.0,
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
                             !   .translate("email"),
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
                            icon: Icons.vpn_key,
                            ispassword: true,
                            placeHolder: ApplicationLocalizations.of(context)
                     !           .translate("password"),
                            inputType: TextInputType.text,
                          ),
                        ),
                        CutomTextButton(
                            ApplicationLocalizations.of(context)
                       !         .translate("have_account"), () {
                          Navigator.of(context)
                              .pushNamed((LoginScreen.routeName));
                        }),

                        SizedBox(
                          height: 20,
                        ),
                        ButtonCustom(
                          txt: ApplicationLocalizations.of(context)
                             ! .translate("sign_up"),
                          ontap: () {
                            Navigator.of(context).pushReplacementNamed(
                                CustomBottomNavigationBar.routeName);
                          },
                          bacgroudColor: kWhiteColor,
                          textColor: kAppColor,
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
