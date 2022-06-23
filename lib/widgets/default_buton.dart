import 'package:dellyshop/constant.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  @override
  String ?txt;
  Color ?bacgroudColor;
  Color? textColor;
  Color borderColor;
  double witdh;
  double height;
  GestureTapCallback? ontap;
  ButtonCustom(
      {this.txt,
      this.ontap,
      this.bacgroudColor,
      this.textColor,
      this.height = 50,
      this.borderColor = Colors.white,
      this.witdh = 300});
  Widget build(BuildContext context) {
     return 
     InkWell(
      onTap: ontap,
      splashColor: Colors.white,
      child: LayoutBuilder(builder: (context, constraint) {
        return   Container(
          height: height,
          width: witdh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
       
 Color(0xFF22B57D),
      Color(0xFF00A99D),
              ],
              
            )
            
        ),
        child: Center(
          child: Text(
                  txt!,
                  style: TextStyle(color: textColor, fontSize: kSubTitleFontSize),
                
          ),
        )); }));}}

  

