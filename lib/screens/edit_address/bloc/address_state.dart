part of 'address_bloc.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}


class AddAddressState extends AddressState{}


class GetCountriesState extends AddressState{
 final CountriesResponseModel countriesResponseModel;

  GetCountriesState(this.countriesResponseModel);
}

class GetCitiesState extends AddressState {
  final CountryCityResponseModel countryCityResponseModel;

  GetCitiesState(this.countryCityResponseModel);
}

class LoadingAddress extends AddAddressState{}

class ErrorAddress extends AddAddressState{
  final String error;

  ErrorAddress(this.error);
}


class LoadingAddingAddressState extends AddressState{}




class AddShippingAddressState extends AddressState{
  
}


class AddPaymentAddressState extends AddressState{}