import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../constants/style.dart';
import '../../reusable_widgets/large_button_reusable.dart';
import '../../reusable_widgets/text_form_field_reusable.dart';

class EditPartiesView extends StatelessWidget {
  final editName = TextEditingController();
  final editNumber = TextEditingController();
  final editEmail = TextEditingController();
  final editCountry = TextEditingController();
  final editState = TextEditingController();
  final editDistrict = TextEditingController();
  final editTown = TextEditingController();
  final editVatPan = TextEditingController();
  EditPartiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Edit Parties'),
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
                  textEditingController: editName,
                ),
                const SizedBox(height: 20),
                Text(
                  "Number",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "+977-1234567890",
                  textEditingController: editNumber,
                ),
                const SizedBox(height: 20),
                Text(
                  "Email",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "example@gmail.com",
                  textEditingController: editEmail,
                ),
                const SizedBox(height: 20),
                Text(
                  "Country",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Nepal",
                  textEditingController: editCountry,
                ),
                const SizedBox(height: 20),
                Text(
                  "State",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Bagmati",
                  textEditingController: editState,
                ),
                const SizedBox(height: 20),
                Text(
                  "District",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Kathmandu",
                  textEditingController: editDistrict,
                ),
                const SizedBox(height: 20),
                Text(
                  "Town",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Kuleshwor",
                  textEditingController: editTown,
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
                  textEditingController: editVatPan,
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
