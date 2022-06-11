
import 'package:flutter/material.dart';

class NormalTextWidget extends StatefulWidget {
  String text;
  Color textColor;
  double textsize;

  NormalTextWidget(this.text, this.textColor, this.textsize);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<NormalTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(color: widget.textColor, fontSize: widget.textsize),
      overflow: TextOverflow.clip,
    );
  }
}
