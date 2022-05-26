import 'package:dellyshop/models/brand_model.dart';
import 'package:dellyshop/screens/brand_detail/brand_detail_screen.dart';
import 'package:dellyshop/screens/home/models/categories_response_model.dart';
import 'package:flutter/material.dart';

class CategoryDetailBody extends StatefulWidget {
  final List<Datum> ?categories;

  const CategoryDetailBody({Key ?key, this.categories}) : super(key: key);
  @override
  _CategoryDetailBodyState createState() => _CategoryDetailBodyState();
}

class _CategoryDetailBodyState extends State<CategoryDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        shrinkWrap: true,
        /// Create List Menu
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: 0.0),
            sliver: SliverFixedExtentList(
                itemExtent: 175.0,
                delegate: SliverChildBuilderDelegate(

                    /// Calling itemCard Class for constructor card
                    (context, index) => ItemCard(widget.categories![index]),
                    childCount: widget.categories!.length)),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Datum category;
  ItemCard(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => BrandDetailScreen(brand)));
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          child: Hero(
            tag: 'hero-tag-${category.id}',
            child: Material(
              color: Colors.transparent,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  image: DecorationImage(
                      image:   NetworkImage(category.image!)  , fit: BoxFit.fill),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      category.name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
