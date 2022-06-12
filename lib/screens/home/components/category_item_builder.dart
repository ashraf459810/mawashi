import 'package:dellyshop/constant.dart';

import 'package:dellyshop/screens/home/models/categories_response_model.dart';
import 'package:flutter/material.dart';

class CategoryListItemBuilder extends StatefulWidget {
  final Datum _categoryModel;

  CategoryListItemBuilder(this._categoryModel);

  @override
  _CategoryListItemBuilderState createState() =>
      _CategoryListItemBuilderState();
}

class _CategoryListItemBuilderState extends State<CategoryListItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(widget._categoryModel.image!),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // gradient: LinearGradient(
                //     colors: [Colors.transparent, kAppColor.withOpacity(0.7)],
                //     begin: FractionalOffset.topCenter,
                //     end: FractionalOffset.bottomCenter),
              ),
            ),
            Center(
              child: Text(
                widget._categoryModel.name!,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kTitleFontSize,
                    fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
