import 'package:dellyshop/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomTextButton extends StatelessWidget {
  String text;
  GestureTapCallback onTap;

  CutomTextButton(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 20.0),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: kAppColor,
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins"),
      ),
    );
  }
}
