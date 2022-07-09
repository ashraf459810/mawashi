
import 'package:dellyshop/screens/edit_address/bloc/address_bloc.dart';
import 'package:dellyshop/screens/edit_address/model/countries_response_model.dart';
import 'package:dellyshop/screens/edit_address/model/country_cities_response_model.dart';
import 'package:dellyshop/widgets/custom_drop_down_button.dart';
import 'package:dellyshop/widgets/default_buton.dart';
import 'package:dellyshop/widgets/default_texfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constant.dart';
import '../../../injection.dart';

// ignore: must_be_immutable
class EditAddressBody extends StatefulWidget {
  EditAddressBody();
  @override
  _EditAddressBodyState createState() => _EditAddressBodyState();
}

class _EditAddressBodyState extends State<EditAddressBody> {
  List<Country> countries = [];
  List<City> cities = [];
  AddressBloc addressBloc = sl<AddressBloc>();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    
    Container(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          CustomTextFromField(
            onChanged: () {},
            height: 60.0,
            icon: Icons.location_city,
            ispassword: false,
            placeHolder: '',
            inputType: TextInputType.text,
          ),
          SizedBox(height: 20),
          // CustomTextFromField(
          //   onChanged: (){},
          //   height: 60.0,
          //   icon: Icons.pin_drop,
          //   ispassword: false,
          //   placeHolder: '',
          //   inputType:
          //       TextInputType.numberWithOptions(signed: true, decimal: true),
          // ),
          SizedBox(height: 20),
          BlocConsumer(
            bloc: addressBloc,
            listener: (context, state) {
           if (state is ErrorAddress){
              Fluttertoast.showToast(msg: state.error);
           }
            },
            builder: (context, state) {
              if (state is LoadingAddress){
                return Center(child: CircularProgressIndicator());
              }
              if (state is GetCountriesState){
                countries =state.countriesResponseModel.data!;
              }
              if (state is GetCitiesState){
cities =state.countryCityResponseModel.data!;
              }
              return Column(
                children: [
                  CustomDropDownButton(
                    dropDownButtonItems: countries.map((e) => e.name!).toList(),
                    placeHolder: '',
                  ),
                  SizedBox(height: 20),
                  CustomDropDownButton(
                    dropDownButtonItems: cities.map((e) => e.name!).toList(),
                    placeHolder: '',
                  ),
                  SizedBox(height: 20),
                  // CustomDropDownButton(
                  //   dropDownButtonItems:
                  //       addressList.map((e) => e.selectStreet).toList(),
                  //   placeHolder: widget.address.selectStreet,
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonCustom(
                    txt: "Save Address",
                    ontap: () {
                      Navigator.of(context).pop();
                    },
                    bacgroudColor: kAppColor,
                    textColor: kWhiteColor,
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
