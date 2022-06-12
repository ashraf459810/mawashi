import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/core/use_case/use_case.dart';
import 'package:dellyshop/screens/cart/model/cart_response_model.dart';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/const/const.dart';
import '../../../injection.dart';
import '../model/add_to_cart_response_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final UseCase addProductToCart ;
  final UseCase getCart;
  String ? session = sl<SharedPreferences>().getString(User.token) ;
  CartBloc(this.addProductToCart, this.getCart) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is AddToCartEvent){
        emit(LoadingAddToCart());
        var response= await addProductToCart.postUsecase( session!=null? "/index.php?route=extension/mstore/cart/add&session=$session" :"/index.php?route=extension/mstore/cart/add" , ([response]) => addToCartResponseModelFromJson(response!), json.encode([{"product_id":event.id,"quantity":event.quantity}]));
        response.fold((l) => emit(AddToCartError(l.message)), (r) {
          sl<SharedPreferences>().setString(User.token, r.session);
          emit(AddToCartState(r));});
      }

          if (event is GetCartEvent){
        emit(LoadingCartState());
        if (session==null){
          emit (GetCartState(CartResponseModel(data: [])));
        }
        else {
        var response= await getCart.getUsecase( "/index.php?route=extension/mstore/cart/index&session=$session"  , ([response]) => cartResponseModelFromJson(response!));
        response.fold((l) => emit(GetCartError(l.message)), (r) {
          emit(GetCartState(r));});
        }}


      
    });
  }
}
