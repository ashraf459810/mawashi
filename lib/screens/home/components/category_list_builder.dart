
import 'package:dellyshop/screens/home/components/category_item_builder.dart';
import 'package:dellyshop/screens/home/models/categories_response_model.dart';

import 'package:flutter/material.dart';


import '../../../constant.dart';

import '../../../util.dart';
import '../../brand_detail/brand_detail_screen.dart';

class CateogryListBuilder extends StatefulWidget {
  final List<Datum>categories;

  const CateogryListBuilder({Key ?key,required this.categories}) : super(key: key);
  @override
  _CateogryListBuilderState createState() => _CateogryListBuilderState();
}

class _CateogryListBuilderState extends State<CateogryListBuilder> {



  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: 80,
          child:
               ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: 'hero-tag-${widget.categories[index].id}',
                      child: Material(
                        color: Utils.isDarkMode
                            ? kDarkDefaultBgColor
                            : Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BrandDetailScreen(category: 
                                          widget.categories[index])));
                            },
                            child: CategoryListItemBuilder(widget.categories[index])),
                      ),
                    );
                  },
                  itemCount: widget.categories.length,
                )
              
        );
    
  }
}
