part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}



class LoadingCategoryState extends HomepageState {

}


class GetCategoriesState extends HomepageState{
  final CategoriesResponseModel categoriesResponseModel ;

  GetCategoriesState(this.categoriesResponseModel);
}
class Error extends HomepageState {
  final String error;

  Error(this.error);
}

class GetTopRatingItemsState extends HomepageState{
  final TopRatingResponseModel topRatingResponseModel;

  GetTopRatingItemsState(this.topRatingResponseModel);
}