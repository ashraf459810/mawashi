import 'package:dellyshop/constant.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  String text;
  Color textColor;
  TextWidget(this.text, this.textColor);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(color: widget.textColor, fontSize: kSmallFontSize),
    );
  }
}
