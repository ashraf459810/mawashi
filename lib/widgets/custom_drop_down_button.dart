import 'package:dellyshop/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../util.dart';
import 'card_widget.dart';

class CustomDropDownButton extends StatefulWidget {
  
  Function? value;
  List<dynamic> ?dropDownButtonItems = [];
  String? placeHolder;
  CustomDropDownButton({@required this.dropDownButtonItems, this.placeHolder,this.value});

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      childWidget: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          dropdownColor: Utils.isDarkMode ? kDarkGrayColor : kWhiteColor,
          value: dropdownvalue,
          hint: TextWidget(widget.placeHolder!,
              Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: kAppColor,
            size: 25,
          ),
          iconSize: 28,
          elevation: 20,
          onChanged: (dynamic newval) {
        print(newval);
            widget.value!(newval);
            setState(() {
              dropdownvalue = newval;
            });
          },
          items: widget.dropDownButtonItems
              !.map<DropdownMenuItem<dynamic>>(( value) {
            return DropdownMenuItem<dynamic>(
              value: value.name,
              child: Text(value.name,
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : kLightBlackTextColor,
                      fontSize: kSmallFontSize)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
