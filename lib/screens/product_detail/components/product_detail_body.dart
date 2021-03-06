import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/my_comment_model.dart';
import 'package:dellyshop/screens/brand_detail/bloc/items_bloc.dart';

import 'package:dellyshop/screens/brand_detail/models/item_response_model.dart';
import 'package:dellyshop/screens/home/components/header_title.dart';

import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/carousel_pro.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:dellyshop/widgets/star_display.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';

import '../../../app_localizations.dart';
import '../../../injection.dart';
import '../../../util.dart';
import '../../cart/bloc/cart_bloc.dart';

// ignore: must_be_immutable
class ProductDetailBody extends StatefulWidget {
  final ItemResponseModel item;
  int _value = 1;

  ProductDetailBody(this.item);

  @override
  _ProductDetailBodyState createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  late String desc;
    CartBloc cartBloc= sl<CartBloc>();
  List<MyCommentModel> myCommentList = [
    MyCommentModel(
      id: 1,
      productName: "iPhone 11 Pro 64 GB",
      companyName: "Apple",
      productImage: kiPhoneImg,
      range: 3,
      commentDate: DateTime.now(),
      userName: "Ufuk Zimmerman",
      userComment:
          "Good quality and beautiful product. The cargo arrived later than expected.",
      isSelect: false,
      price: 949.99,
    ),
  ];

  static var _subHeaderCustomStyle = TextStyle(
      color: kAppColor,
      fontWeight: FontWeight.w700,
      fontSize: kSubTitleFontSize);

  @override
  void initState() {
    // desc = widget.item.data!.description!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        productImages(),
        Container(
          width: size.width,
          decoration: BoxDecoration(
              color: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 1.0,
                  spreadRadius: 0.2,
                )
              ]),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rating(),
              SizedBox(
                height: 10,
              ),
              header(context),
              SizedBox(
                height: 2.0,
              ),
              // NormalTextWidget(
              //     widget.productItemModel.company!,
              //     Utils.isDarkMode ? kDarkTextColorColor : kTextColorColor,
              //     kTitleFontSize),
              SizedBox(
                height: 10,
              ),
              colorAndAmount(size),
              SizedBox(
                height: 10,
              ),
              // Visibility(
              //   visible: widget.productItemModel.sizable!,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text("Size", style: _subHeaderCustomStyle),
              //       Row(
              //         children: <Widget>[
              //           Padding(padding: EdgeInsets.only(right: 5.0)),
              //           RadioButtonCustom(
              //             txt: "S",
              //           ),
              //           Padding(padding: EdgeInsets.only(left: 5.0)),
              //           RadioButtonCustom(
              //             txt: "M",
              //           ),
              //           Padding(padding: EdgeInsets.only(left: 5.0)),
              //           RadioButtonCustom(
              //             txt: "L",
              //           ),
              //           Padding(padding: EdgeInsets.only(left: 5.0)),
              //           RadioButtonCustom(
              //             txt: "XL",
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              description(size),
              SizedBox(
                height: 10,
              ),
              addToCart(size),
              HeaderTitle(
                  ApplicationLocalizations.of(context)!.translate("comments"),
                  ApplicationLocalizations.of(context)!.translate("view_all"),
                  kAppColor, () {
                _commentBottomSheet();
              }),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: myCommentList.take(2).length * 160.0,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (c, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardWidget(
                        height: 140,
                        childWidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child:
                                  StarDisplay(value: myCommentList[i].range!),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NormalTextWidget(myCommentList[i].userName!,
                                    kAppColor, kTitleFontSize),
                                NormalTextWidget(
                                    Jiffy(myCommentList[i].commentDate).yMMMd,
                                    Utils.isDarkMode
                                        ? kDarkTextColorColor
                                        : kGrayColor,
                                    kSmallFontSize),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              myCommentList[i].userComment!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Utils.isDarkMode
                                      ? kDarkBlackTextColor
                                      : kLightBlackTextColor,
                                  fontSize: kSubTitleFontSize),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: myCommentList.take(2).length,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Center addToCart(Size size) {
    return Center(
      child: BlocConsumer(
        bloc: cartBloc,
        listener: (context, state) {
         if (state is Error){
           Fluttertoast.showToast(msg: state.error);
         }
             if (state is AddToCartState){
            // Fluttertoast.showToast(msg: "?????? ?????????????? ?????? ??????????");
          }
        //  if (state is AddToCartState){
        //        Fluttertoast.showToast(msg: "Added Successfully");
        //  }
        },
        builder: (context, state) {
          if (state is LoadingAddToCart){
                return CircularProgressIndicator(color: kAppColor,backgroundColor: Colors.white,);
          }
      
          
          return ButtonCustom(
            txt: ApplicationLocalizations.of(context)!.translate("add_to_cart"),
            witdh: size.width,
            ontap: () {
              cartBloc.add(AddToCartEvent(widget.item.data!.productId!, widget._value.toString()));

            },
            bacgroudColor: kAppColor,
            textColor: kWhiteColor,
          );
        },
      ),
    );
  }

  Container description(Size size) {
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            ApplicationLocalizations.of(context)!.translate("description"),
            style: TextStyle(
                color: kAppColor,
                fontWeight: FontWeight.w700,
                fontSize: kTitleFontSize),
          ),
          Html(data: widget.item.data!.description!),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                _bottomSheet();
              },
              child: Text(
                ApplicationLocalizations.of(context)!.translate("view_more"),
                style: TextStyle(
                  color: kAppColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row colorAndAmount(Size size) {
    return Row(
      children: [
        // Visibility(
        //   visible: widget.item.colorable!,
        //   child: SizedBox(
        //     height: 40,
        //     width: size.width / 2,
        //     child: ListView.builder(
        //         itemCount: widget.colors.length,
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (c, i) {
        //           return Center(
        //             child: RadioButtonColor(widget.colors[i]),
        //           );
        //         }),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            /// Decrease of value item
            InkWell(
              onTap: () {
                setState(() {
                  if (widget._value != 1) {
                    widget._value = widget._value - 1;
                  }
                });
              },
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: kAppColor.withOpacity(0.7),
                  border: Border(
                      right: BorderSide(
                        color: Colors.black12.withOpacity(0.1),
                      ),
                      left: BorderSide(
                        color: Colors.black12.withOpacity(0.1),
                      )),
                ),
                child: Center(
                    child: Text(
                  "-",
                  style:
                      TextStyle(color: kWhiteColor, fontSize: kLargeFontSize),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                widget._value.toString(),
                style: TextStyle(
                  color: Utils.isDarkMode
                      ? kDarkBlackTextColor
                      : kLightBlackTextColor,
                  fontSize: kLargeFontSize,
                ),
              ),
            ),

            /// Increasing value of items
            InkWell(
              onTap: () {
                setState(() {
                  print("Click");
             
              widget._value = widget._value + 1;
                });
              },
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    color: kAppColor.withOpacity(0.7),
                    border: Border(
                        left: BorderSide(
                            color: Colors.black12.withOpacity(0.1)))),
                child: Center(
                    child: Text(
                  "+",
                  style:
                      TextStyle(color: kWhiteColor, fontSize: kNormalFontSize),
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: NormalTextWidget(
              widget.item.data!.name!,
              Utils.isDarkMode ? kDarkBlackTextColor : kLightBlackTextColor,
              kNormalFontSize),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.data!.price!,
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Utils.isDarkMode
                      ? kDarkBlackTextColor
                      : kLightBlackTextColor,
                  fontSize: kSubTitleFontSize),
            ),
            NormalTextWidget(
                widget.item.data!.price!, kAppColor, kLargeFontSize),
          ],
        ),
      ],
    );
  }

  rating() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 30.0,
                width: 75.0,
                decoration: BoxDecoration(
                  color: kAppColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.item.data!.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8.0)),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 19.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              "${widget.item.data!.points} ${ApplicationLocalizations.of(context)!.translate("sale")}",
              style: TextStyle(
                  color:
                      Utils.isDarkMode ? kDarkTextColorColor : kTextColorColor,
                  fontSize: kTitleFontSize,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Container productImages() {
    return Container(
      height: 300.0,
      child: Hero(
        tag: "hero-Item-${widget.item.data!.productId.toString()}",
        child: Carousel(
          dotColor: Colors.black26,
          dotIncreaseSize: 1.7,
          dotBgColor: Colors.transparent,
          autoplay: false,
          boxFit: BoxFit.fill,
          images: widget.item.data!.images!.map((e) {
            var w = NetworkImage(
              e,
            );

            return w;
          }).toList(),
          overlayShadowColors: Colors.transparent,
          radius: Radius.zero,
          radiusDouble: 0,
        ),
      ),
    );
  }

  void _bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Utils.isDarkMode ? kDarkDefaultBgColor : kWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0))),
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          ApplicationLocalizations.of(context)!
                              .translate("description"),
                          style: TextStyle(
                              color: kAppColor, fontSize: kTitleFontSize),
                        ),
                      ),
                      Html(data: desc),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 205.0,
                          width: 650.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 20.0),
                                //   child: Text(
                                //     ApplicationLocalizations.of(context)
                                //         !.translate("product_detail"),
                                //     style: TextStyle(
                                //         color: kAppColor,
                                //         fontSize: kTitleFontSize),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       top: 10.0,
                                //       right: 20.0,
                                //       bottom: 10.0,
                                //       left: 20.0),
                                //   child: Text(
                                //     widget.item.data!.dateAvailable.toString(),
                                //     style: TextStyle(
                                //         color: Utils.isDarkMode
                                //             ? kDarkBlackTextColor
                                //             : kLightBlackTextColor),
                                //     textDirection: TextDirection.ltr,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _commentBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color:
                      Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0))),
              child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: SizedBox(
                    height: myCommentList.length * 160.0,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardWidget(
                            height: 140,
                            childWidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: StarDisplay(
                                      value: myCommentList[i].range!),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    NormalTextWidget(myCommentList[i].userName!,
                                        kAppColor, kTitleFontSize),
                                    NormalTextWidget(
                                        Jiffy(myCommentList[i].commentDate)
                                            .yMMMd,
                                        Utils.isDarkMode
                                            ? kDarkTextColorColor
                                            : kGrayColor,
                                        kSmallFontSize),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  myCommentList[i].userComment!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Utils.isDarkMode
                                          ? kDarkBlackTextColor
                                          : kLightBlackTextColor,
                                      fontSize: kSubTitleFontSize),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: myCommentList.length,
                    ),
                  )),
            ),
          );
        });
  }
}
