import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class LastViewBody extends StatefulWidget {
  @override
  _LstViewBodyState createState() => _LstViewBodyState();
}

class _LstViewBodyState extends State<LastViewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(productList[index])));
            },
            child: ProductItem(
              productItem: productList[index],
            ),
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
