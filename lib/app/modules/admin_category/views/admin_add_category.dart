import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/text_form_field_reusable.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/upload_image_reusable.dart';

import '../../../constants/colors.dart';

class AdminAddCategory extends StatelessWidget {
  final List<String> _list = [
    'Active',
    'InActive',
  ];
  final categoryName = TextEditingController();
  final remarks = TextEditingController();
  AdminAddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Add Category"),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category Name: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter Category Name",
                  textEditingController: categoryName,
                ),
                const SizedBox(height: 20),
                Text(
                  "Status: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomDropdown<String>(
                  hintText: 'status',
                  items: _list,
                  initialItem: _list[0],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                Text(
                  "Remarks: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: remarks,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: AppColors.lightSilver,
                    constraints: BoxConstraints.expand(
                      height: 200,
                    ),
                    hintText: 'Write Remarks Here ....',
                    // border: inputBorder,
                    // focusedBorder: inputBorder,
                    // enabledBorder: inputBorder,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  maxLength: 250,
                  maxLines: 50,
                ),
                const SizedBox(height: 20),
                const UploadImageReusable(),
                const SizedBox(height: 20),
                const LargeButtonReusable(title: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
