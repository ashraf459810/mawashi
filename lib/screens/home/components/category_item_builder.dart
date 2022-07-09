import 'package:dellyshop/constant.dart';
import 'package:dellyshop/core/const/const.dart';

import 'package:dellyshop/screens/home/models/categories_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      children: [
        Container(
          width: 120.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            
            image: DecorationImage(
              fit: BoxFit.contain,
              
              image: NetworkImage("https://livestock.mjnna.com/image/"+ widget._categoryModel.icon!,),
              
            ),
          ),
       
          
        ),
         Text(
            widget._categoryModel.name!.trim(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
            maxLines: 1,
          )
      ],
    );
  }
}
