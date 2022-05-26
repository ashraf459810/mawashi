import 'package:dellyshop/models/my_comment_model.dart';
import 'package:dellyshop/widgets/card_widget.dart';
import 'package:dellyshop/widgets/normal_text.dart';
import 'package:dellyshop/widgets/star_display.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../constant.dart';
import '../../../util.dart';

class MyCommentsBody extends StatefulWidget {
  @override
  _MyCommentsBodyState createState() => _MyCommentsBodyState();
}

class _MyCommentsBodyState extends State<MyCommentsBody>
    with TickerProviderStateMixin {
      List<MyCommentModel> myCommentList = [
  MyCommentModel(
    id: 1,
    productName: "iPhone 11 Pro 64 GB",
    companyName: "Apple",
    productImage: kiPhoneImg,
    range: 3,
    commentDate: DateTime.now(),
    userName: "Ufuk Zimmerman",
    userComment:
        "Good quality and beautiful product. The cargo arrived later than expected.",
    isSelect: false,
    price: 949.99,
  ),
  MyCommentModel(
    id: 2,
    productName: "Macbook Pro 13\" 256 GB",
    companyName: "Apple",
    productImage: "assets/images/mackbook.jpg",
    userName: "Ufuk Zimmerman",
    userComment: "Nice machine, I love Apple products!",
    range: 5,
    commentDate: DateTime.now(),
    isSelect: false,
    price: 449.99,
  ),
  MyCommentModel(
    id: 3,
    productName: "Nike Air Max 270",
    companyName: "Nike",
    productImage: "assets/images/shoes2.jpg",
    range: 4,
    commentDate: DateTime.now(),
    userName: "Ufuk Zimmerman",
    userComment:
        "It is a very fast and stable product. I really like! The cargo arrived very quickly. I am very pleased with this situation. I will now make my other orders with you.",
    isSelect: false,
    price: 130.99,
  )
];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return buildProductItem(index);
        },
        itemCount: myCommentList.length,
      ),
    );
  }

  buildProductItem(int index) {
    return AnimatedSize(
      duration: new Duration(seconds: 1),
      curve: Curves.elasticOut,
      vsync: this,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardWidget(
          height: myCommentList[index].itemHeight!,
          childWidget: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0, top: 5.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(myCommentList[index].productImage!),
                        )),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(myCommentList[index].productName!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Utils.isDarkMode
                                    ? kDarkTextColorColor
                                    : kLightBlackTextColor,
                                fontSize: kTitleFontSize)),
                        Text(myCommentList[index].companyName!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: kGrayColor, fontSize: kSmallFontSize)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${myCommentList[index].price}\$",
                          style: TextStyle(
                              color: kAppColor, fontSize: kPriceFontSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        myCommentList[index].isSelect =
                            myCommentList[index].isSelect == false;
                        myCommentList[index].arrowRotate =
                            myCommentList[index].isSelect! ? 90 : 0;
                        if (myCommentList[index].itemHeight == 150)
                          myCommentList[index].itemHeight = 250;
                        else {
                          myCommentList[index].itemHeight = 150;
                        }
                      },
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarDisplay(value: myCommentList[index].range!),
                      RotationTransition(
                        turns: new AlwaysStoppedAnimation(
                            myCommentList[index].arrowRotate! / 360),
                        child: Icon(Icons.arrow_forward_ios,
                            size: 25, color: kAppColor),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: myCommentList[index].isSelect!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NormalTextWidget(myCommentList[index].userName!,
                            kAppColor, kTitleFontSize),
                        NormalTextWidget(
                            Jiffy(myCommentList[index].commentDate).yMMMd,
                            Utils.isDarkMode
                                ? kDarkTextColorColor
                                : kLightBlackTextColor,
                            kSmallFontSize),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      myCommentList[index].userComment!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                          color: Utils.isDarkMode
                              ? kDarkBlackTextColor
                              : kLightBlackTextColor,
                          fontSize: kSubTitleFontSize),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
