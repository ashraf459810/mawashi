part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}



class GetCategoriesEvent extends HomepageEvent {
  
}

class GetTopRatingItemsEvent extends HomepageEvent{

  final String page;

  GetTopRatingItemsEvent(this.page);
}

class GetItemsEvent extends HomepageEvent{

  final String page;

  GetItemsEvent(this.page);
}


class GetSliderEvent extends HomepageEvent{}