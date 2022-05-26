import 'package:dellyshop/constant.dart';
import 'package:dellyshop/widgets/carousel_pro.dart';
import 'package:dellyshop/widgets/shimmer_widger.dart';
import 'package:flutter/material.dart';

class CarouselViewBuilder extends StatefulWidget {
  @override
  _CarouselViewBuilderState createState() => _CarouselViewBuilderState();
}

class _CarouselViewBuilderState extends State<CarouselViewBuilder> {
  List<dynamic> ?_assetImages;
  List<dynamic> assetImages = [
    AssetImage("assets/images/category_shoes.jpg"),
    AssetImage("assets/images/category_camera.jpeg"),
    AssetImage("assets/images/category_electronics.jpeg"),
    AssetImage("assets/images/category_clothes.jpeg"),
    AssetImage("assets/images/category3.png"),
  ];

  @override
  void initState() {
    super.initState();
    gerData();
  }

  gerData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _assetImages = assetImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 182.0,
      child: _assetImages != null
          ? new Carousel(
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
              images: _assetImages!)
          : ShimmerWidget(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kWhiteColor,
                ),
                height: 182.0,
              ),
            ),
    );
  }
}
