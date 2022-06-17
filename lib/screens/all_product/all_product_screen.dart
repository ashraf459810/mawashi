import 'package:dellyshop/screens/brand_detail/models/category_items_response_model.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'components/all_product_body.dart';

class AllProductItemScreen extends StatelessWidget {
  final List<Item>items;
  static const routeName = "/all_product_screen";

  const AllProductItemScreen({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "All Product",
      body: AllProductScreenBody(items: items),
    );
  }
}
