import 'package:dellyshop/app_localizations.dart';
import 'package:dellyshop/constant.dart';
import 'package:dellyshop/screens/all_product/all_product_screen.dart';

import 'package:dellyshop/screens/category_detail/category_detail_screen.dart';
import 'package:dellyshop/screens/home/components/carousel_view_builder.dart';
import 'package:dellyshop/screens/home/components/category_list_builder.dart';
import 'package:dellyshop/screens/home/components/grid_item_list.dart';
import 'package:dellyshop/util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../injection.dart';
import '../../../widgets/shimmer_widger.dart';
import '../bloc/homepage_bloc.dart';
import '../models/categories_response_model.dart';
import 'header_title.dart';
import 'item_list_builder.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
    HomepageBloc homepageBloc = sl<HomepageBloc>();
  List<Datum> categories = [];
  @override
  void initState() {
   homepageBloc.add(GetCategoriesEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.isDarkMode ? kDarkColor : kWhiteColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderTitle(
                ApplicationLocalizations.of(context)!.translate("categories"),
                ApplicationLocalizations.of(context)!.translate("view_all"),
                Utils.isDarkMode ? kDarkBlackFontColor : kLightBlackTextColor,
                () {
              Navigator.of(context).pushNamed(CategoryDetailScreen.routeName,arguments: categories);
            }),
            BlocConsumer(
        bloc: homepageBloc,
        listener: (context, state) {
         if (state is Error){
           Fluttertoast.showToast(
          msg:state.error,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor:kAppColor,
          textColor: Colors.white,
          fontSize: 16.0
          );
         }
        },
        builder: (context, state) {
          if (state is LoadingCategoryState){
          
            return SizedBox(
              height: 60.h,
              child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShimmerWidget(
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 5,
                    ),
            );
      
          }
          if (state is GetCategoriesState){
            categories =state.categoriesResponseModel.data!;
          }
          return
            CateogryListBuilder(categories: categories);
        }),
            CarouselViewBuilder(),
            HeaderTitle(
                ApplicationLocalizations.of(context)!.translate("best_seller"),
                ApplicationLocalizations.of(context)!.translate("view_all"),
                Utils.isDarkMode ? kDarkBlackFontColor : kLightBlackTextColor,
                () {
              Navigator.of(context).pushNamed(AllProductItemScreen.routeName);
            }),
            ItemListBuilder(),
            HeaderTitle(
                ApplicationLocalizations.of(context)!.translate("newest"),
                ApplicationLocalizations.of(context)!.translate("view_all"),
                Utils.isDarkMode ? kDarkBlackFontColor : kLightBlackTextColor,
                ()  {
              Navigator.of(context).pushNamed(AllProductItemScreen.routeName);
            }),
            // GridListBuilder(),
          ],
        ),
      ),
    );
  }
}
