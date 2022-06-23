



import 'package:dellyshop/screens/activation_code/activation_code.dart';
import 'package:dellyshop/screens/register/register_screen.dart';
import 'package:dellyshop/widgets/bottom_navigation_bar.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:dellyshop/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_localizations.dart';
import '../../../constant.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
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
          fit: BoxFit.fill,
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
        
                SizedBox(height: 185.h,),
                                    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            onChanged: (){},

                            icon: Icons.person,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)
                             !   .translate("name"),
                            inputType: TextInputType.name,
                          ),
                        ),
                           Padding(padding: EdgeInsets.symmetric(vertical:10.0)),
                               Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            onChanged: (){},

                            icon: Icons.email,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)
                             !   .translate("email"),
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical:10.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            height: 50.h,
                            onChanged: (){},
                            icon: Icons.mobile_friendly_rounded,
                            
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)
                               ! .translate("mobile"),
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                           Padding(padding: EdgeInsets.symmetric(vertical:10.0)),
                                              Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            onChanged: (){},

                            icon: Icons.pin_drop,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)
                             !   .translate("address"),
                            inputType: TextInputType.name,
                          ),
                        ),
                        SizedBox(height: 30.h,),
                                    ButtonCustom(
                          height: 60.h,
                          witdh: 280.w,
                          
                          txt: ApplicationLocalizations.of(context)
                           !   .translate("register"),
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivationCode(),));
                          },
                          bacgroudColor: kWhiteColor,
                          textColor: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    
           
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
                          height: 60.h,
                          witdh: 280.w,
                          
                          txt: ApplicationLocalizations.of(context)
                           !   .translate("sign_in"),
                          ontap: () {
                             Navigator.of(context).pop();
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
