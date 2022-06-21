import 'dart:developer';

import 'package:dellyshop/core/const/const.dart';
import 'package:dellyshop/screens/home/bloc/homepage_bloc.dart';
import 'package:dellyshop/screens/home/components/product_item_builder.dart';

import 'package:dellyshop/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../injection.dart';
import '../../../util.dart';
import '../../brand_detail/models/category_items_response_model.dart';

class AllProductScreenBody extends StatefulWidget {
   List<Item> items;

   AllProductScreenBody({Key? key, required this.items}) : super(key: key);
  @override
  _AllProductScreenBody createState() => _AllProductScreenBody();
}

class _AllProductScreenBody extends State<AllProductScreenBody> {
  ScrollController scrollController = ScrollController();
  HomepageBloc homepageBloc = sl<HomepageBloc>();
  int page = 1;
  @override
  void initState() {
    scrollController.addListener(pagination);
    if (widget.items.isEmpty) {
      homepageBloc.add(GetItemsEvent(page.toString()));
    }
    log("herer form all");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SearchScreen.routeName);
            },
            child: Container(
              height: 40,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  shape: BoxShape.rectangle),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BlocConsumer(
          bloc: homepageBloc,
          listener: (context, state) {
            if (state is Error){
              Fluttertoast.showToast(msg: state.error);
            }
          },
          builder: (context, state) {
            if (state is LoadingCategoryState && widget.items.isEmpty){
              return Center(child: CircularProgressIndicator(color: AppColor.blue,));
            }
            if (state is GetItemsState){
              widget.items=state.topRatingResponseModel.data!;
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (140 / Utils.GridHeight()!).h,
              ),
              itemCount: widget.items.length,
              controller: ScrollController(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Hero(
                  tag: "hero-Item-${widget.items[index].model}",
                  child: Material(
                    child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             ProductDetailScreen(value)));
                        },
                        child: FittedBox(
                          child: ProductItemBuilder(
                              isDiscount: false,
                              productItem: widget.items[index]),
                        )),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
    void pagination() {

      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
       
      
          page ++;
  homepageBloc.add(GetItemsEvent
        (page.toString()));

      
      }
  }
}
