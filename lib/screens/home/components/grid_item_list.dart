import 'dart:io';

import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/home/components/product_item_builder.dart';
import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';
import 'package:dellyshop/util.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class GridListBuilder extends StatefulWidget {
  Widget Item;
  @override
  _GridListBuilderState createState() => _GridListBuilderState();
}

class _GridListBuilderState extends State<GridListBuilder> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (140 / Utils.GridHeight()),
      controller: new ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: newestLit.map(
        (value) {
          return Hero(
            tag: "hero-Item-${value.id}",
            child: Material(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(value)));
                  },
                  child: FittedBox(
                    child: ProductItemBuilder(
                        isDiscount: false, productItem: value),
                  )),
            ),
          );
        },
      ).toList(),
    );
  }
}

void _onTileClicked(int index) {
  debugPrint("You tapped on item $index");
}
