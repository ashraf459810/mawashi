part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}


class AddToCartError extends CartState{
  final String error;

  AddToCartError(this.error);
}

class LoadingAddToCart extends CartState{


}


class AddToCartState extends CartState{
  
}