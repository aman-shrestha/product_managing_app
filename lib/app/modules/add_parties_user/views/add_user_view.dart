// ignore_for_file: must_be_immutable

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../constants/style.dart';
import '../../reusable_widgets/large_button_reusable.dart';
import '../../reusable_widgets/text_form_field_reusable.dart';

class AddUser extends StatelessWidget {
  final List<String> _list = [
    'Sales Person',
    'Admin',
  ];
  final userName = TextEditingController();
  final userNumber = TextEditingController();
  final userEmail = TextEditingController();
  final userCountry = TextEditingController();
  final userState = TextEditingController();
  final userDistrict = TextEditingController();
  final userTown = TextEditingController();
  final userVatPan = TextEditingController();
  AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Add User'),
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
                  textEditingController: userName,
                ),
                const SizedBox(height: 20),
                Text(
                  "Number",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "+977-1234567890",
                  textEditingController: userNumber,
                ),
                const SizedBox(height: 20),
                Text(
                  "Email",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "example@gmail.com",
                  textEditingController: userEmail,
                ),
                const SizedBox(height: 20),
                Text(
                  "Country",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Nepal",
                  textEditingController: userCountry,
                ),
                const SizedBox(height: 20),
                Text(
                  "State",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Bagmati",
                  textEditingController: userState,
                ),
                const SizedBox(height: 20),
                Text(
                  "District",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Kathmandu",
                  textEditingController: userDistrict,
                ),
                const SizedBox(height: 20),
                Text(
                  "Town",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Kuleshwor",
                  textEditingController: userTown,
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
                  textEditingController: userVatPan,
                ),
                const SizedBox(height: 20),
                Text(
                  "Role",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomDropdown<String>(
                  hintText: 'Select job role',
                  items: _list,
                  initialItem: _list[0],
                  onChanged: (value) {},
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
