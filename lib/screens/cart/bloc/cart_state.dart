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
class GetCartError extends CartState{
  final String error;

  GetCartError(this.error);
}

class AddToCartState extends CartState{
  final AddToCartResponseModel addToCartResponseModel;

  AddToCartState(this.addToCartResponseModel); 
}

class LoadingCartState extends CartState{}

class GetCartState extends CartState{
  final CartResponseModel cartResponseModel;

  GetCartState(this.cartResponseModel);
}