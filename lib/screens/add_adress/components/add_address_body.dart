import 'package:dellyshop/screens/add_adress/model/address_body_model.dart';
import 'package:dellyshop/screens/edit_address/model/countries_response_model.dart';

import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:dellyshop/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_localizations.dart';
import '../../../constant.dart';
import '../../../core/const/const.dart';
import '../../../injection.dart';
import '../../edit_address/bloc/address_bloc.dart';
import '../../edit_address/model/country_cities_response_model.dart';

class AddAddressBody extends StatefulWidget {
  @override
  _AddAddressBodyState createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
  AddressBodyModel addressBodyModel = AddressBodyModel();
  String? country;
  String? name;
  String? address;
  String? mobile;
  String? addressDetails;
  String? city;
  List<Country> countries = [];
  List<City> cities = [];
  String? email;
  AddressBloc addressBloc = sl<AddressBloc>();
  @override
  void initState() {
    addressBloc.add(GetCountriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          CustomTextFromField(
            onChanged: (val) {
              addressDetails = val;
              addressBodyModel.address2 = val;
            },
            height: 60.0,
            icon: Icons.location_city,
            ispassword: false,
            placeHolder: 'تفاصيل العنون',
            inputType: TextInputType.text,
          ),
          SizedBox(height: 20),
          BlocConsumer(
            bloc: addressBloc,
            listener: (context, state) {
              if (state is ErrorAddress) {
                Fluttertoast.showToast(msg: state.error);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddress && countries.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is GetCountriesState) {
                countries = state.countriesResponseModel.data!;
              }
              if (state is GetCitiesState) {
                cities = state.countryCityResponseModel.data!;
              }
              return Column(
                children: [
                  DropDown(
                    getindex: (val) {},
                    chosenvalue: country,
                    onchanged: (val) {
                      addressBodyModel.countryId = val.countryId;
                      country = val.name;
                      addressBloc.add(
                          GetCitiesForCountryEvent(int.parse(val.countryId)));
                    },
                    list: countries,
                    hint: "اختر البلد",
                  ),
                  SizedBox(height: 20),
                  state is LoadingAddress
                      ? Center(child: CircularProgressIndicator())
                      : DropDown(
                          chosenvalue: city,
                          getindex: (val) {},
                          onchanged: (val) {
                            addressBodyModel.city = val.name;
                          },
                          list: cities,
                          hint: 'اختر المدينة',
                        ),
                  SizedBox(height: 20),
                  sl<SharedPreferences>().getBool(User.isRegistred) ?? false
                      ? SizedBox()
                      : Column(
                          children: [
                            CustomTextFromField(
                              onChanged: (val) {
                                email = val;
                                addressBodyModel.email = email;
                              },
                              height: 60.h,
                              icon: Icons.email,
                              ispassword: false,
                              placeHolder: ApplicationLocalizations.of(context)!
                                  .translate("email"),
                              inputType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFromField(
                              onChanged: (val) {
                                name = val;
                                addressBodyModel.firstname = name;
                              },
                              height: 60.h,
                              icon: Icons.email,
                              ispassword: false,
                              placeHolder: ApplicationLocalizations.of(context)!
                                  .translate("name"),
                              inputType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                  CustomTextFromField(
                    onChanged: (val) {
                      address = val;

                      addressBodyModel.address1 = address;
                    },
                    height: 60.h,
                    icon: Icons.pin_drop,
                    ispassword: false,
                    placeHolder: ApplicationLocalizations.of(context)!
                        .translate("address"),
                    inputType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFromField(
                    validation: (String val) {
                      if (!val.startsWith("05")) {
                        return "الرقم يجب ان يبدأ ب ٠٥";
                      }
                    },
                    height: 60.h,
                    onChanged: (val) {
                      mobile = val;
                      addressBodyModel.telephone = mobile;
                    },
                    icon: Icons.mobile_friendly_rounded,
                    ispassword: false,
                    placeHolder: ApplicationLocalizations.of(context)!
                        .translate("mobile"),
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer(
                    bloc: addressBloc,
                    listener: (context, state) {
                      if (state is ErrorAddress) {
                        Fluttertoast.showToast(msg: state.error);
                      }
                             if (state is AddShippingAddressState) {
                        addressBloc
                            .add(AddPaymentAddressEvent(addressBodyModel));
                      }

                             if (state is AddPaymentAddressState) {
                    Fluttertoast.showToast(msg: "تم اضافة العنوان بنجاح");
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingAddingAddressState) {
                        return Center(child: CircularProgressIndicator());
                      }
               
                      
                      return ButtonCustom(
                        txt: ApplicationLocalizations.of(context)!
                            .translate("save"),
                        ontap: () {
   addressBodyModel.lastname = name;
                          print(addressBodyModel.address1);
                      print(addressBodyModel.address2);
                       print(addressBodyModel.firstname);
                        print(addressBodyModel.lastname);
                         print(addressBodyModel.email);
                          print(addressBodyModel.telephone);
                           print(addressBodyModel.city);
                            print(addressBodyModel.countryId);
                          if (addressBodyModel.address1 != null &&
                              addressBodyModel.address2 != null &&
                              addressBodyModel.firstname != null &&
                              addressBodyModel.lastname!=null&&
                              addressBodyModel.telephone != null &&
                          addressBodyModel.countryId != null &&
                              addressBodyModel.city != null &&
                              addressBodyModel.email != null) {
                            addressBodyModel.session =
                                sl<SharedPreferences>().getString(User.token);
                                addressBodyModel.lastname  = name;  
                            addressBloc
                                .add(AddShippingAddressEvent(addressBodyModel));
                          } else {
                            Fluttertoast.showToast(
                                msg: "الرجاء اكمال المعلومات اولا");
                          }
                        },
                        bacgroudColor: kAppColor,
                        textColor: kWhiteColor,
                      );
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    ));
  }
}
