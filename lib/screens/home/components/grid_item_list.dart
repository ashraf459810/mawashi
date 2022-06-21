
import 'package:dellyshop/screens/home/components/product_item_builder.dart';
import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';

import 'package:flutter/material.dart';


import '../../brand_detail/models/category_items_response_model.dart';

class GridListBuilder extends StatefulWidget {
  final List<Item> topRating;

  const GridListBuilder({Key? key, required this.topRating}) : super(key: key);

  @override
  _GridListBuilderState createState() => _GridListBuilderState();
}

class _GridListBuilderState extends State<GridListBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

    itemCount: widget.topRating.length,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing:5.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7
              ),
      controller: new ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) { 

    
          return Hero(
            tag: "hero-Item-${widget.topRating[index].productId.toString()}",
            child: Material(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(itemId: widget.topRating[index].productId!,)));
                  },
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: ProductItemBuilder(
                        isDiscount: false, productItem: widget.topRating[index]),
                  )),
            ),
          );
        },
    );
    
  }
}

