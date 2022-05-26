part of 'items_bloc.dart';

@immutable
abstract class ItemsEvent {}


class GetCategoryItemsEvent extends ItemsEvent{
  final String categoryId;

  GetCategoryItemsEvent(this.categoryId);
}


class GetItemDetailsEvent extends ItemsEvent{ 
  final String itemId;

  GetItemDetailsEvent(this.itemId);
}