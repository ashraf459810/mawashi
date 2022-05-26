import '../constant.dart';

class MyCommentModel {
  int ?id;
  String ?productName;
  String ?companyName;
  String ?productImage;
  int ?range;
  DateTime? commentDate;
  String? userName;
  String? userComment;
  bool ?isSelect;
  double? price;
  double? itemHeight;
  int? arrowRotate;

  MyCommentModel(
      {this.id,
      this.price,
      this.productName,
      this.companyName,
      this.productImage,
      this.range,
      this.userName,
      this.commentDate,
      this.userComment,
      this.isSelect,
      this.arrowRotate = 0,
      this.itemHeight = 150});
}

