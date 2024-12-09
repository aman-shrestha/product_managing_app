import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/text_form_field_reusable.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/upload_image_reusable.dart';

class AdminAddProduct extends StatelessWidget {
  final category = TextEditingController();
  final productName = TextEditingController();
  final sellPrice = TextEditingController();
  final vat = TextEditingController();
  final discount = TextEditingController();
  final unit = TextEditingController();
  final maxAllowedDiscount = TextEditingController();
  AdminAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Add Product"),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter Category",
                  textEditingController: category,
                ),
                const SizedBox(height: 20),
                Text(
                  "Product Name: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter Product Name",
                  textEditingController: productName,
                ),
                const SizedBox(height: 20),
                Text(
                  "Sell Price: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter Sell Price",
                  textEditingController: sellPrice,
                ),
                const SizedBox(height: 20),
                Text(
                  "VAT: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter VAT %",
                  textEditingController: vat,
                ),
                const SizedBox(height: 20),
                Text(
                  "Discount: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter Discount %",
                  textEditingController: discount,
                ),
                const SizedBox(height: 20),
                Text(
                  "Max Allowed Discount: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter Max AllowedDiscount",
                  textEditingController: maxAllowedDiscount,
                ),
                const SizedBox(height: 20),
                Text(
                  "Unit: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "Enter Unit",
                  textEditingController: unit,
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
