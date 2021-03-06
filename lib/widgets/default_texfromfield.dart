

import 'package:dellyshop/constant.dart';
import 'package:flutter/material.dart';


import '../util.dart';
import 'card_widget.dart';

class CustomTextFromField extends StatelessWidget {
  bool? ispassword;
  String ?placeHolder;
  IconData? icon;
  Function? validation;
  TextInputType? inputType;
  double ?height;
  bool ?isMasked = false;
  Function onChanged ;
  CustomTextFromField(
      {
        this.validation,
        this.placeHolder,
      this.icon,
      this.inputType,
      this.ispassword,
     required this.onChanged,
      this.isMasked,
      this.height = 50.0});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      
      height: height!,
      childWidget: Theme(
        data: ThemeData(
          hintColor: Colors.transparent,
        ),
        child: TextFormField(
        
          
          validator: (value) {
          return  validation!(value);
          }, 
          onChanged:((value) => {
            onChanged(value)
            }),
          textInputAction: TextInputAction.done,
          obscureText: ispassword!,
          style: TextStyle(
              color: Utils.isDarkMode
                  ? kDarkTextColorColor
                  : kLightBlackTextColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: placeHolder,
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            labelStyle: TextStyle(
                fontSize: 15.0,
                letterSpacing: 0.3,
                color: Utils.isDarkMode ? kDarkTextColorColor : kTextColorColor,
                fontWeight: FontWeight.w600),
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }
}
