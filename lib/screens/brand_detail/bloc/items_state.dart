part of 'items_bloc.dart';

@immutable
abstract class ItemsState {}

class ItemsInitial extends ItemsState {}


class GetCategoryItemsState extends ItemsState {
  final CategoryItemsResponseModel categoryItemsResponseModel;

  GetCategoryItemsState(this.categoryItemsResponseModel);
}

class Loading extends ItemsState {}



class Error extends ItemsState{
  final String error ;

  Error(this.error);
}

class GatItemDetailsState extends ItemsState{
  final ItemResponseModel item;

  GatItemDetailsState(this.item);
}

