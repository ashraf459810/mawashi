import 'package:dellyshop/models/address_model.dart';
import 'package:dellyshop/screens/edit_address/components/edit_address_body.dart';
import 'package:dellyshop/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditAddressScreen extends StatelessWidget {
  Address address;
  EditAddressScreen(this.address);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Edit Address",
      body: EditAddressBody(),
    );
  }
}
