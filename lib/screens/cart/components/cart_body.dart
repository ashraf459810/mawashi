import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/address_model.dart';
import 'package:dellyshop/screens/add_adress/add_address_screen.dart';
import 'package:dellyshop/screens/select_credit_card/select_credit_card_screen.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/custom_drop_down_button.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util.dart';

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  var selectedUser;

  double totalListHeight;
  double itemHeight = 120;
  int index = 1;
  int value = 2;
  int pay = 200;
  int totalpay;
  @override
  Widget build(BuildContext context) {
    totalpay = pay * value;
    totalListHeight = ((index * itemHeight)).toDouble();

    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          //Product List
          SizedBox(
            height: totalListHeight,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: itemHeight,
                  child: CartProductItem(index),
                );
              },
              itemCount: index,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 1.0,
              color: kLightBlackTextColor.withOpacity(0.3),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CardWidget(
            childWidget: FractionalTranslation(
              translation: Offset(0.0, -0.1),
              child: ListTile(
                title: Text(
                  ApplicationLocalizations.of(context)
                      .translate("shipping_cost"),
                  style: TextStyle(
                      color: Utils.isDarkMode
                          ? kDarkBlackTextColor
                          : kLightBlackTextColor),
                ),
                subtitle: Text(
                  ApplicationLocalizations.of(context)
                      .translate("ship_company"),
                  style: TextStyle(
                      color:
                          Utils.isDarkMode ? kDarkTextColorColor : kGrayColor),
                ),
                trailing: Text(
                  "12\$",
                  style: TextStyle(color: kAppColor, fontSize: kPriceFontSize),
                ),
                leading: Container(
                  child: Icon(
                    Icons.local_shipping,
                    size: 35,
                    color: kAppColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          CardWidget(
            childWidget: ListTile(
              title: Text(
                ApplicationLocalizations.of(context).translate("total_price"),
                style: TextStyle(
                    color: Utils.isDarkMode
                        ? kDarkBlackTextColor
                        : kLightBlackTextColor),
              ),
              trailing: Text(
                "${totalpay + 12}\$",
                style: TextStyle(color: kAppColor, fontSize: kPriceFontSize),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TextWidget(
                ApplicationLocalizations.of(context)
                    .translate("select_address"),
                kAppColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomDropDownButton(
                dropDownButtonItems:
                    addressList.map((e) => e.addressName).toList(),
                placeHolder: ApplicationLocalizations.of(context)
                    .translate("select_address"),
              ),
              CardWidget(
                  childWidget: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AddAddressScreen.routeName);
                },
                child: Row(
                  children: [
                    TextWidget(
                        ApplicationLocalizations.of(context)
                            .translate("add_address"),
                        Utils.isDarkMode
                            ? kDarkTextColorColor
                            : kLightBlackTextColor),
                    Icon(
                      Icons.add,
                      color: kAppColor,
                      size: 20,
                    )
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonCustom(
            txt: ApplicationLocalizations.of(context)
                .translate("select_credit_card"),
            ontap: () {
              Navigator.of(context).pushNamed(SelectCreditCartScreen.routeName);
            },
            bacgroudColor: kAppColor,
            textColor: kWhiteColor,
          )
        ],
      ),
    );
  }

  CartProductItem(int index) {
    return Dismissible(
      onDismissed: (val) {
        setState(() {
          index--;
          totalListHeight = ((index * itemHeight)).toDouble();
        });
      },
      background: slideRightBackground(),
      secondaryBackground: slideLeftBackground(),
      key: UniqueKey(),
      child: CardWidget(
        height: itemHeight,
        childWidget: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/iphone11.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("iphone 11 Pro 64 GB",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Utils.isDarkMode
                              ? kDarkBlackTextColor
                              : kLightBlackTextColor,
                          fontSize: kTitleFontSize)),
                  Text("Apple",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Utils.isDarkMode
                              ? kDarkTextColorColor
                              : kGrayColor,
                          fontSize: kSmallFontSize)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "200\$",
                        style: TextStyle(
                            color: kAppColor, fontSize: kPriceFontSize),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, right: 10.0),
                        child: Container(
                          width: 112.0,
                          decoration: BoxDecoration(
                            color:
                                Utils.isDarkMode ? kDarkGrayColor : kWhiteColor,
                            border: Border(
                              top: BorderSide(
                                color: Colors.black12.withOpacity(0.1),
                              ),
                              bottom: BorderSide(
                                color: Colors.black12.withOpacity(0.1),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              /// Decrease of value item
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (value != 1) {
                                      value = value - 1;
                                      totalpay = pay * value;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    color: kAppColor.withOpacity(0.7),
                                    border: Border(
                                        right: BorderSide(
                                          color:
                                              Colors.black12.withOpacity(0.1),
                                        ),
                                        left: BorderSide(
                                          color:
                                              Colors.black12.withOpacity(0.1),
                                        )),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "-",
                                    style: TextStyle(color: kWhiteColor),
                                  )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Text(
                                  value.toString(),
                                  style: TextStyle(
                                      color: Utils.isDarkMode
                                          ? kDarkTextColorColor
                                          : kTextColorColor),
                                ),
                              ),

                              /// Increasing value of item
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value = value + 1;
                                    totalpay = pay * value;
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 28.0,
                                  decoration: BoxDecoration(
                                      color: kAppColor.withOpacity(0.7),
                                      border: Border(
                                          left: BorderSide(
                                              color: Colors.black12
                                                  .withOpacity(0.1)))),
                                  child: Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(color: kWhiteColor),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.red,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              ApplicationLocalizations.of(context).translate("delete"),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.red,
      ),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
