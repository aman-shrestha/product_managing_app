import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/text_form_field_reusable.dart';
import '../controllers/add_parties_controller.dart';

class AddPartiesView extends GetView<AddPartiesController> {
  final partyName = TextEditingController();
  final partyNumber = TextEditingController();
  final partyEmail = TextEditingController();
  final partyCountry = TextEditingController();
  final partyState = TextEditingController();
  final partyDistrict = TextEditingController();
  final partyTown = TextEditingController();
  final partyVatOrPan = TextEditingController();
  final List list = [
    "VAT",
    "PAN",
  ];
  AddPartiesView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Add Parties'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Name",
                  textEditingController: partyName,
                ),
                const SizedBox(height: 20),
                Text(
                  "Number",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "+977-1234567890",
                  textEditingController: partyNumber,
                ),
                const SizedBox(height: 20),
                Text(
                  "Email",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "example@gmail.com",
                  textEditingController: partyEmail,
                ),
                const SizedBox(height: 20),
                Text(
                  "Country",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Nepal",
                  textEditingController: partyCountry,
                ),
                const SizedBox(height: 20),
                Text(
                  "State",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Bagmati",
                  textEditingController: partyState,
                ),
                const SizedBox(height: 20),
                Text(
                  "District",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Kathmandu",
                  textEditingController: partyDistrict,
                ),
                const SizedBox(height: 20),
                Text(
                  "Town",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Kuleshwor",
                  textEditingController: partyTown,
                ),
                const SizedBox(height: 20),
                Text(
                  "VAT/PAN",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                // CustomDropdown(
                //   hintText: 'Select VAT/PAN',
                //   items: list,
                //   onChanged: (value) {
                //     // log('changing value to: $value');
                //   },
                // ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "",
                  textEditingController: partyVatOrPan,
                ),
                const SizedBox(height: 20),
                const LargeButtonReusable(title: "Add")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
