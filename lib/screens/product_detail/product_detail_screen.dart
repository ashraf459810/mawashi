import 'package:dellyshop/constant.dart';
import 'package:dellyshop/core/const/const.dart';

import 'package:dellyshop/screens/brand_detail/bloc/items_bloc.dart';

import 'package:dellyshop/screens/brand_detail/models/item_response_model.dart';
import 'package:dellyshop/screens/cart/cart_screen.dart';
import 'package:dellyshop/screens/product_detail/components/product_detail_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app_localizations.dart';
import '../../injection.dart';
import '../../util.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String itemId;
  static const routeName = "/product_detail_screen";
  ProductDetailsScreen({Key? key, required this.itemId}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ItemResponseModel ?item  ;
  ItemsBloc itemsBloc = sl<ItemsBloc>();
  @override
  void initState() {
    itemsBloc.add(GetItemDetailsEvent(widget.itemId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: itemsBloc,
      listener: (context, state) {
        if (state is Error){
          Fluttertoast.showToast(msg: state.error);
        }
        },
        builder: (context, state) {
          if (State is ItemsInitial){
                     return CircularProgressIndicator(color: AppColor.blue,backgroundColor: Colors.white,);
          }
          if (state is GatItemDetailsState){
    
item = state.item;
          }
          if (state is Loading){
            return Scaffold(body: Center(child: CircularProgressIndicator(color: AppColor.blue,backgroundColor: Colors.white,)));
          }
        return Scaffold(
            backgroundColor:
                Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor:
                  Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
              iconTheme: IconThemeData(color: kAppColor),
              title: Text(
                ApplicationLocalizations.of(context)!
                    .translate("product_detail"),
                style: TextStyle(color: kAppColor),
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed((CartScreen.routeName));
                  },
                  child: Stack(
                    alignment: AlignmentDirectional(-1.0, -0.8),
                    children: <Widget>[
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Utils.isDarkMode
                                ? kDarkBottomIconColor
                                : kBottomIconColor,
                          )),
                      CircleAvatar(
                        radius: 10.0,
                        backgroundColor: Colors.red,
                        child: Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body:  item !=null? ProductDetailBody(item!):SizedBox()
            );
      },
    );
  }
}
