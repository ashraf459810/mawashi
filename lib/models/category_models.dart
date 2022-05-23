

class CategoryModel {
  String categoryName;
  String categoryImage;
  int id;

  CategoryModel({this.categoryName, this.categoryImage, this.id});
}

List<CategoryModel> categoryList = [
  CategoryModel(
    categoryName: "Shoes",
    categoryImage: "assets/images/category_shoes.jpg",
  ),
  CategoryModel(
    categoryName: "Electronics",
    categoryImage: "assets/images/category_electronics.jpeg",
  ),
  CategoryModel(
    categoryName: "Gaming",
    categoryImage: "assets/images/gaming.jpg",
  ),
  CategoryModel(
    categoryName: "Clothes",
    categoryImage: "assets/images/category_clothes.jpeg",
  )
];
