import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/core/use_case/use_case.dart';
import 'package:dellyshop/screens/brand_detail/models/category_items_response_model.dart';
import 'package:dellyshop/screens/brand_detail/models/item_response_model.dart';
import 'package:meta/meta.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
      final UseCase getategoryItems;
      final UseCase getItemDetails;
  ItemsBloc(this.getategoryItems, this.getItemDetails) : super(ItemsInitial()) {

    on<ItemsEvent>((event, emit) async {

      if (event is GetItemDetailsEvent){
        emit(Loading());
       
      var response= await getategoryItems.getUsecase("/index.php?route=extension/mstore/product/detail&productId=${event.itemId}", ([response]) => itemResponseModelFromJson(response!), );
      response.fold((l) => emit(Error(l.message)), (r) => emit(GatItemDetailsState(r)));
      }
    
  

      if (event is GetCategoryItemsEvent){
        emit(Loading());
        var body = {"category" : event.categoryId};
      var response= await getategoryItems.postUsecase("/index.php?route=extension/mstore/product/index", ([response]) => categoryItemsResponseModelFromJson(response!), json.encode(body) );
      response.fold((l) => emit(Error(l.message)), (r) => emit(GetCategoryItemsState(r)));
      }
    });
  }
}
