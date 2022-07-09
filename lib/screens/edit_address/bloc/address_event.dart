part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}


class AddAddressEvent extends AddressEvent{

}

class GetCountriesEvent extends AddressEvent{

}

class GetCitiesForCountryEvent extends AddressEvent{ 
  final int countryId;

  GetCitiesForCountryEvent(this.countryId);
}