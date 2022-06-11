import 'package:dellyshop/models/product_item_model.dart';
import 'package:dellyshop/screens/brand_detail/models/category_items_response_model.dart';
import 'package:dellyshop/widgets/shimmer_widger.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../util.dart';
import 'product_item_builder.dart';

class ItemListBuilder extends StatefulWidget {
  @override
  _ItemListBuilderState createState() => _ItemListBuilderState();
}

class _ItemListBuilderState extends State<ItemListBuilder> {
  
  List<ProductItemModel> ?_productList;
  @override
  void initState() {
          _productList = productList;
    super.initState();
    gerData();
  }

  gerData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
      child: SizedBox(
        height: 310,
        child: _productList != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: "hero-Item-${productList[index].id}",
                    child: Material(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ProductDetailScreen(
                          //             _productList![index])));
                        },
                  child:  FittedBox(
                          child: ProductItemBuilder(
                            isDiscount: true,
                            productItem: Item(description: "test", image: "/cache/catalog/sheep/Goat/Somalian%20Goat-500x500.jpg",price: "100",name: "mobile",rating: 5)
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: productList.length,
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ShimmerWidget(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 160.0,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
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
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
      ),
    );
  }
}
