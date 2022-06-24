import 'package:dellyshop/constant.dart';
import 'package:dellyshop/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_localizations.dart';
import '../../widgets/default_buton.dart';
import '../../widgets/default_texfromfield.dart';

class ActivationCode extends StatefulWidget {
  ActivationCode({Key? key}) : super(key: key);

  @override
  State<ActivationCode> createState() => _ActivationCodeState();
}

class _ActivationCodeState extends State<ActivationCode> {
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
          child: ListView(children: [

              Column(
                children: [
                  SizedBox(height: 220.h,),
                  Text( ApplicationLocalizations.of(context)
                               !   .translate("activation code sent to",),style: TextStyle(color: textColor,fontSize: 18.sp),),
SizedBox(height: 10.h,),
                               Text('07507611798',style: TextStyle(color: textColor,fontSize: 18.sp),),
                               SizedBox(height: 15.h,),
                                       Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            height: 50.h,
                            onChanged: (){},
                            icon: Icons.mobile_friendly_rounded,
                            
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)
                               ! .translate("activation code"),
                            inputType: TextInputType.name,
                          ),
                        ),
                        SizedBox(height: 40.h,
                        ),

                          ButtonCustom(
                          height: 60.h,
                          witdh: 280.w,
                          
                          txt: ApplicationLocalizations.of(context)
                           !   .translate("confirm"),
                          ontap: () {
                                        Navigator.of(context)
                              .pushNamed((HomeScreen.routeName));
                          },
                          bacgroudColor: kWhiteColor,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 10.h,),


SizedBox(height: 15.h,),
 Text( ApplicationLocalizations.of(context)
                               !   .translate("didn't receive activation code",),style: TextStyle(color: textColor,fontSize: 18.sp),),
                               SizedBox(height: 25.h,),
                                    ButtonCustom(
                          height: 60.h,
                          witdh: 280.w,
                          
                          txt: ApplicationLocalizations.of(context)
                           !   .translate("resend"),
                          ontap: () {
                                        Navigator.of(context)
                              .pushNamed((HomeScreen.routeName));
                          },
                          bacgroudColor: kWhiteColor,
                          textColor: Colors.white,
                        ),
                ],
              )
          ],))));
  }
}