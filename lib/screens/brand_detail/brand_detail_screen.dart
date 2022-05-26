import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/core/const/const.dart';

import 'package:dellyshop/screens/brand_detail/bloc/items_bloc.dart';
import 'package:dellyshop/screens/brand_detail/models/category_items_response_model.dart';
import 'package:dellyshop/screens/home/components/product_item_builder.dart';
import 'package:dellyshop/screens/home/models/categories_response_model.dart';
import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../constant.dart';
import '../../injection.dart';
import '../../util.dart';


class BrandDetailScreen extends StatefulWidget {
  final Datum category;

  const BrandDetailScreen({Key ?key,required  this.category}) : super(key: key);

  @override
  _BrandDetailScreenState createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
  final _fontCostumSheetBotomHeader = TextStyle(
      color: Utils.isDarkMode ? kDarkTextColorColor : kLightBlackTextColor,
      fontWeight: FontWeight.w600,
      fontSize: kSubTitleFontSize);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  /// Custom text for bottomSheet
  final _fontCostumSheetBotom = TextStyle(
      color: Utils.isDarkMode ? kDarkBlackTextColor : Colors.black45,
      fontWeight: FontWeight.w400,
      fontSize: kSubTitleFontSize);
      ItemsBloc itemsBloc = sl<ItemsBloc>();
      List<Item> items = [];
@override
  void initState() {
    print( widget.category.description);
itemsBloc.add(GetCategoryItemsEvent(widget.category.id!));
    super.initState();
  }
  /// Create Modal BottomSheet (SortBy)
  void _modalBottomSheetSort() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 340.0,
              color: Utils.isDarkMode ? kDarkDefaultBgColor : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                      ApplicationLocalizations.of(context)!.translate("sort_by"),
                      style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        ApplicationLocalizations.of(context)
                           ! .translate("popularity"),
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("new"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("discount"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("high_low"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("low_high"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }

  /// Create Modal BottomSheet (RefineBy)
  void _modalBottomSheetRefine() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 340.0,
              color: Utils.isDarkMode ? kDarkDefaultBgColor : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                      ApplicationLocalizations.of(context)
                          !.translate("refine_by"),
                      style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        ApplicationLocalizations.of(context)
                           ! .translate("popularity"),
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("new"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("discount"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("high_low"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    ApplicationLocalizations.of(context)!.translate("low_high"),
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
        final hero = Hero(
      tag: 'hero-tag-${widget.category.id}',
      child: Material(
        child: new DecoratedBox(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(widget.category.image!),
            ),
            shape: BoxShape.rectangle,
          ),
          child: Container(
            margin: EdgeInsets.only(top: 130.0),
            decoration: BoxDecoration(),
          ),
        ),
      ),
    );  
    /// Hero animation for image
return     Scaffold(
      backgroundColor: Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
        key: _key,
  body:   BlocConsumer(
              bloc: itemsBloc,
              listener: (context, state) {
        if (state is Error){
          Fluttertoast.showToast(msg:state.error);
        }
              },
              builder: (context, state) {
                if (state is GetCategoryItemsState){
                  items = state.categoryItemsResponseModel.data!;
                }
                if (state is Loading){
                  return 
                  Center(child: CircularProgressIndicator(color: AppColor.blue,backgroundColor: Colors.white,));
                }
                if (state is ItemsInitial){
                              return 
                  Center(child: CircularProgressIndicator(color: AppColor.blue,backgroundColor: Colors.white,)); 
                }
                
      return CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            /// Appbar Custom using a SliverAppBar
            SliverAppBar(
              centerTitle: true,
              backgroundColor:
                  Utils.isDarkMode ? kDarkDefaultBgColor : kDefaultBgColor,
              iconTheme: IconThemeData(color: kAppColor),
              expandedHeight: 380.0,
              elevation: 0.1,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    widget.category.name!,
                    style: TextStyle(
                        color: kAppColor,
                        fontSize: 17.0,
                        fontFamily: "Popins",
                        fontWeight: FontWeight.w700),
                  ),
                  background: Material(
                    child: hero,
                  )),
            ),
  
            /// Container for description to Sort and Refine
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, left: 20.0, right: 20.0),
                                child: Text(
                                  
                               widget.category.description!,
                                  // ApplicationLocalizations.of(context)
                                  //     !.translate("lorem"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0,
                                      color: Utils.isDarkMode
                                          ? kDarkTextColorColor
                                          : Colors.black54),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
  
            /// Create Grid Item
     SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen( itemId: items[index].productId!,)));
                          },
                          child: FittedBox(
                            child: ProductItemBuilder(
                                isDiscount: false,
                                productItem: items[index]),
                          ));
                    },
                    childCount: items.length,
                  ),
  
                  /// Setting Size for Grid Item
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250.0,
                    mainAxisSpacing: 7.0,
                    crossAxisSpacing: 7.0,
                    childAspectRatio: 0.605,
                  ),
                
              
            ),
          ],
        );
       }
));
  }
}
