import 'package:dellyshop/constant.dart';
import 'package:dellyshop/core/navigate/nav.dart';
import 'package:dellyshop/screens/all_product/all_product_screen.dart';
import 'package:dellyshop/screens/home/bloc/homepage_bloc.dart';
import 'package:dellyshop/screens/home/models/categories_response_model.dart';
import 'package:dellyshop/screens/product_detail/product_detail_screen.dart';


import 'package:dellyshop/widgets/carousel_pro.dart';
import 'package:dellyshop/widgets/shimmer_widger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../brand_detail/brand_detail_screen.dart';

class CarouselViewBuilder extends StatefulWidget {
  final HomepageBloc homepageBloc;

  const CarouselViewBuilder({Key? key, required this.homepageBloc})
      : super(key: key);
  @override
  _CarouselViewBuilderState createState() => _CarouselViewBuilderState();
}

class _CarouselViewBuilderState extends State<CarouselViewBuilder> {
  List<dynamic>_assetImages = [];
  List<dynamic> assetImages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: widget.homepageBloc,
      listener: (context, state) {
        if (state is Error) {
          Fluttertoast.showToast(msg: state.error);
        }
        if (state is GetSliderState) {
          _assetImages =state.sliderResponseModel.data!;
        }
      },
      builder: (context, state) {
        if (state is LoadingSliderState) {
          return ShimmerWidget(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: kWhiteColor,
              ),
              height: 182.0,
            ),
          );
        }
        return Container(
            margin: EdgeInsets.all(10.0),
            height: 182.0,
            child: _assetImages.isNotEmpty
                ? Carousel(
                    overlayShadowColors: Colors.transparent,
                    borderRadius: true,
                    boxFit: BoxFit.cover,
                    radiusDouble: 10,
                    radius: Radius.circular(10.0),
                    dotColor: kWhiteColor,
                    dotSize: 5.5,
                    dotSpacing: 16.0,
                    dotBgColor: Colors.transparent,
                    showIndicator: true,
                    overlayShadow: true,
                    overlayShadowSize: 0.9,
                    images: _assetImages.map((e) {
                      var w = Image.network(
                      "https://livestock.mjnna.com/image/"+  e.url!,
                      fit: BoxFit.fill,
                      );

                      return GestureDetector(onTap: (){
                        print(e.type);
                        if(e.type=="Category"){
                          nav(context, BrandDetailScreen(category: Datum(id: e.id,description: '',count: '',name: ''),));

                        }
                      else   if(e.type=="Product"){
                          nav(context, ProductDetailsScreen(itemId: e.id),);

                        }
                        else {
                            nav(context, AllProductItemScreen(items: []),);
                        }
                      },
                        child:
                      w);
                    }).toList(),
                  )
                : SizedBox());
      },
    );
  }
}
