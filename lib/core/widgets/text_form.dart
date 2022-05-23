// ignore: import_of_legacy_library_into_null_safe

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/const.dart';


Widget textform(
    { TextEditingController controller,
     Function function,
    Key key,
    String hint,
    Color hintColor,
    double hintsize,
     String keyboard,
      validation,
      String errorText,
    EdgeInsetsGeometry padding,
    int maxlines,
    bool issecure}) {
  return TextFormField(
    
    // focusNode: FocusNode(canRequestFocus: false),
    

    key: key,
    style: TextStyle(color: Colors.black, fontSize: 18.sp,),
    obscureText: issecure ?? false,
    keyboardType: keyboard == "number"
        ? TextInputType.phone
        : keyboard == "name"
            ? TextInputType.name
            : keyboard == "email"
                ? TextInputType.emailAddress
                : TextInputType.text,
    decoration: InputDecoration(
      
      errorText:  '',
        errorStyle: TextStyle(fontSize: 8.sp,),
        contentPadding: padding ?? EdgeInsets.only(top: 20.h,left: 10.w),
        border: InputBorder.none,
        hintText: hint,
        isDense: true,
        hintStyle: TextStyle(
          color: hintColor ?? AppColor.brown,
          fontWeight: FontWeight.bold,
          fontSize: hintsize ?? 15.sp,
        )),
    controller: controller,

    validator: validation  ?? (String  val){
      return null;
    } ,
    // expands: true,
    maxLines: maxlines ?? 1,
    minLines: null,
    onChanged: (value) {
      function(value);
    },
  );
}

String passwordvalidator(String value) {
  if (value.isEmpty) {
    return "enter your password";
  }
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  RegExp regExp = RegExp(pattern);
  bool validpassword = regExp.hasMatch(value);
  if (validpassword == true) {
    return '';
  } else {
    return "passwrod lenght 8 contains numbers capital and small letters";
  }
}

String emailvalidator(String value) {
  if (value.isEmpty) {
    return 'Enter Your Email';
  }

  bool emailValid = EmailValidator.validate(value);

  if (emailValid == true) {
    return '';
  } else {
    return "Enter a valid email";
  }
}

String numbervalidator(String value) {
  if (value.isEmpty) {
    return "please enter a number";
  }
  if (int.parse(value) <= 0) {
    return "please Enter Positive Number";
  }
  return '';
}

String defaultvalidation(String value) {
  return value;
}
