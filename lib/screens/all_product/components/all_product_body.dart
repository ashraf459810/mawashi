import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/home/components/product_item_builder.dart';

import 'package:dellyshop/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util.dart';
import '../../brand_detail/models/category_items_response_model.dart';

class AllProductScreenBody extends StatefulWidget {
 final List<Item> items;

  const AllProductScreenBody({Key? key, required this.items}) : super(key: key);
  @override
  _AllProductScreenBody createState() => _AllProductScreenBody();
}

class _AllProductScreenBody extends State<AllProductScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
          childAspectRatio: (140 / Utils.GridHeight()!).h,),
         itemCount: widget.items.length,
          controller: new ScrollController(keepScrollOffset: false),
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
                            isDiscount: false, productItem: widget.items[index]),
                      )
                      ),
                ),
              );
            },
          
        ),
      ],
    );
  }
}
