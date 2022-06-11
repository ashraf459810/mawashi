import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/core/use_case/use_case.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final UseCase addProductToCart ;
  CartBloc(this.addProductToCart) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is AddToCartEvent){
        emit(LoadingAddToCart());
        var response= await addProductToCart.postUsecase("/index.php?route=extension/mstore/cart/add", ([response]) => {}, json.encode({"product_id":event.id,"quantity":event.quantity}));
        response.fold((l) => emit(AddToCartError(l.message)), (r) => emit(AddToCartState()));
      }


      
    });
  }
}
