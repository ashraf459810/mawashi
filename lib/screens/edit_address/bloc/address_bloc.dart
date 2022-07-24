import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/core/use_case/use_case.dart';
import 'package:dellyshop/screens/edit_address/model/countries_response_model.dart';
import 'package:dellyshop/screens/edit_address/model/country_cities_response_model.dart';
import 'package:meta/meta.dart';

import '../../add_adress/model/address_body_model.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final UseCase getCountries;
  final UseCase getCities;
   final UseCase addShippingAddress;
  final UseCase addPaymentAddress;
  AddressBloc(this.getCountries, this.getCities, this.addShippingAddress, this.addPaymentAddress) : super(AddressInitial()) {
    on<AddressEvent>((event, emit) async {
      if (event is GetCountriesEvent ){
        emit (LoadingAddress());
        var response = await getCountries.getUsecase("/index.php?route=extension/mstore/shipping_address/countries&lang=ar", ([response]) => countriesResponseModelFromJson(response!));
        response.fold((l) => emit(ErrorAddress(l.message)), (r) => emit(GetCountriesState(r)));
      }

            if (event is GetCitiesForCountryEvent ){
        emit (LoadingAddress());
        var response = await getCountries.getUsecase("/index.php?route=extension/mstore/shipping_address/states&lang=ar&countryId=${event.countryId}", ([response]) => countryCityResponseModelFromJson(response!));
        response.fold((l) => emit(ErrorAddress(l.message)), (r) => emit(GetCitiesState(r)));
      }

          if (event is AddShippingAddressEvent){

          
        // emit (LoadingAddingAddressState());
        var response =await addShippingAddress.postUsecase(
          "/index.php?route=extension/mstore/shipping_address/save&lang=ar", ([response]) => response,jsonEncode(event.addressBodyModel) );
        response.fold((l) => emit(ErrorAddress(l.message)), (r) => emit(AddShippingAddressState()));
      }

            if (event is AddPaymentAddressEvent){
        emit (LoadingAddingAddressState());
        var response =await addShippingAddress.postUsecase("/index.php?route=extension/mstore/payment_address/save&lang=ar", ([response]) => response,jsonEncode(event.addressBodyModel) );
        response.fold((l) => emit(ErrorAddress(l.message)), (r) => emit(AddPaymentAddressState()));
      }
      
    });
  }
}
