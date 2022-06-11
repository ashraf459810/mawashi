part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}


class AddToCartEvent extends CartEvent {
  final String id;
  final String quantity;

  AddToCartEvent(this.id, this.quantity);
}