import 'package:bloc/bloc.dart';
import 'package:dellyshop/core/use_case/use_case.dart';
import 'package:dellyshop/screens/edit_address/model/countries_response_model.dart';
import 'package:dellyshop/screens/edit_address/model/country_cities_response_model.dart';
import 'package:meta/meta.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final UseCase getCountries;
  final UseCase getCities;
  AddressBloc(this.getCountries, this.getCities) : super(AddressInitial()) {
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
      
    });
  }
}
