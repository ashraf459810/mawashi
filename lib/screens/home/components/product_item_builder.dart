import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/product_item_model.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';
import '../../../util.dart';
import '../../brand_detail/models/category_items_response_model.dart';

class ProductItemBuilder extends StatefulWidget {
  bool? isDiscount;
  Item ?productItem;
  ProductItemBuilder({this.isDiscount, this.productItem});

  @override
  _ProductItemBuilderState createState() => _ProductItemBuilderState();
}

class _ProductItemBuilderState extends State<ProductItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: <Widget>[
          Container(
            width: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Utils.isDarkMode
                        ? kGrayColor.withOpacity(0.2)
                        : kGrayColor.withOpacity(0.5),
                    offset: Offset(1, 2),
                    blurRadius: 5),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 185.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7.0),
                              topRight: Radius.circular(7.0)),
                          image: DecorationImage(
                              image: NetworkImage( "https://livestock.mjnna.com/image/"+widget.productItem!.image!),
                              fit: BoxFit.cover)),
                    ),
                    Opacity(
                      opacity: widget.isDiscount! ? 1.0 : 0.0,
                      child: Container(
                        height: 25.5,
                        width: 55.0,
                        decoration: BoxDecoration(
                            color: kAppColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(5.0))),
                        child: Center(
                            child: Text(
                          "12%",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Utils.isDarkMode ? kDarkColor : kWhiteColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 7.0)),
                        Container(
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              widget.productItem!.name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  color: Utils.isDarkMode
                                      ? kDarkBlackTextColor
                                      : kLightBlackTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.0)),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Text(
                            widget.productItem!.price!,
                            style: TextStyle(
                                color: kAppColor,
                                fontWeight: FontWeight.w500,
                                fontSize: kNormalFontSize),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.productItem!.rating.toString(),
                                    style: TextStyle(
                                        color: Utils.isDarkMode
                                            ? kDarkBlackTextColor
                                            : kLightBlackTextColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14.0,
                                  )
                                ],
                              ),
                              Text(
                                "${widget.productItem!.price} ${ApplicationLocalizations.of(context)!.translate("sale")}",
                                style: TextStyle(
                                    color: kGrayColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
