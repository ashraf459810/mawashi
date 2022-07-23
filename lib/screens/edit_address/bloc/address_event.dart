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


class AddShippingAddressEvent extends AddressEvent{

 final AddressBodyModel addressBodyModel;

  AddShippingAddressEvent(this.addressBodyModel);

}


class AddPaymentAddressEvent extends AddressEvent {
 final AddressBodyModel addressBodyModel;

  AddPaymentAddressEvent(this.addressBodyModel);


}