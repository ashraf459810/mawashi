import 'package:dellyshop/core/navigate/nav.dart';
import 'package:dellyshop/screens/activation_code/activation_code.dart';
import 'package:dellyshop/screens/register/bloc/register_bloc.dart';
import 'package:dellyshop/screens/register/model/register_request_body.dart';
import 'package:dellyshop/screens/register/register_screen.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:dellyshop/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../app_localizations.dart';
import '../../../constant.dart';
import '../../../injection.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
 RegisterRequestBody  registerRequestBody = RegisterRequestBody(confirm: '',email: '',firstname: '',lastname: '',password: '',telephone: '');
  RegisterBloc registerBloc = sl<RegisterBloc>();
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
                          height: 200.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            validation: (val){
                              if (val.length< 5){
                                print("less than 5");
                              }
                            },
                            height: 50.h,
                            onChanged: (val) {
                              registerRequestBody.firstname = val;
                            },
                            icon: Icons.person,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)!
                                .translate("name"),
                            inputType: TextInputType.name,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            onChanged: (val) {
                                   registerRequestBody.email = val;
                            },
                            height: 50.h,
                            icon: Icons.email,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)!
                                .translate("email"),
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            validation: (String val){
                               if (!val.startsWith ("05") ){
                          return "الرقم يجب ان يبدأ ب ٠٥";
                        }
                            },
                            height: 50.h,
                            onChanged: (val) {
                                   registerRequestBody.telephone = val;
                            },
                            icon: Icons.mobile_friendly_rounded,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)!
                                .translate("mobile"),
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: CustomTextFromField(
                            onChanged: (val) {
                                
                            },
                            height: 50.h,
                            icon: Icons.pin_drop,
                            ispassword: false,
                            placeHolder: ApplicationLocalizations.of(context)!
                                .translate("address"),
                            inputType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        BlocConsumer(
                          bloc: registerBloc,
                          listener: (context, state) {
                                if (state is Error){
                                  Fluttertoast.showToast(msg: state.error);
                                }
                                if (state is RegisterNewUserState){
                                 navWithReplacement(context, ActivationCode());
                                }
                          },
                          builder: (context, state) {
                            if (state is Loading){
                              return CircularProgressIndicator(color: kAppColor,);
                            }
                          
                            return ButtonCustom(
                              height: 60.h,
                              witdh: 280.w,
                              txt: ApplicationLocalizations.of(context)!
                                  .translate("register"),
                              ontap: () {
                               if (registerRequestBody.firstname!=null && registerRequestBody.email!=null && registerRequestBody.telephone!=null && registerRequestBody.telephone!.startsWith("05")){
                                registerBloc.add(RegisterNewUserEvent(registerRequestBody));
                               }
                               else {
                                Fluttertoast.showToast(msg: "الرجاء اكمال المعلومات اولا");
                               }
                              
                              },
                              bacgroudColor: kWhiteColor,
                              textColor: Colors.white,
                            );
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                        CutomTextButton(
                            ApplicationLocalizations.of(context)!
                                .translate("have_account"), () {
                          Navigator.of(context)
                              .pushNamed((RegisterScreen.routeName));
                        }),
                        SizedBox(
                          height: 25,
                        ),

                        ButtonCustom(
                          height: 60.h,
                          witdh: 280.w,
                          txt: ApplicationLocalizations.of(context)!
                              .translate("sign_in"),
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
