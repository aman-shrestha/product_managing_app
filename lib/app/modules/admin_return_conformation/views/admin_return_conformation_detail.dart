import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/user_info_container.dart';

import '../../../constants/colors.dart';
import '../../reusable_widgets/small_button_reusable.dart';

class AdminReturnConformationDetail extends StatelessWidget {
  final desController = TextEditingController();
  AdminReturnConformationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Return Confirmation Detail"),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserInfoContainer(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.lightSilver),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Return Details",
                        style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Invoice No: ",
                        style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "8365",
                        style: smallStyle.copyWith(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Product Name: ",
                        style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Glico Pocky Biscuit Stick Strawberry",
                        style: smallStyle.copyWith(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Issued Date: ",
                        style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "1 Dec 2024",
                        style: smallStyle.copyWith(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Reason: ",
                            style: smallStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Defective Item",
                            style: smallStyle.copyWith(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "I am returning this product because it does not match the description provided on the website. The item I received differs in size and color, and it is not suitable for my needs",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Remarks: ",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: desController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: AppColors.lightSilver,
                    constraints: BoxConstraints.expand(
                      height: 200,
                    ),
                    hintText: 'Write Description Here ....',
                    // border: inputBorder,
                    // focusedBorder: inputBorder,
                    // enabledBorder: inputBorder,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  maxLength: 250,
                  maxLines: 50,
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallButtonReusable(
                      // color: AppColors.green,
                      // textColor: Colors.white,
                      icon: Icon(
                        Icons.check_circle,
                        // color: Colors.white,
                      ),
                      title: "Approve",
                      width: 140,
                    ),
                    SizedBox(width: 8),
                    SmallButtonReusable(
                      // color: AppColors.red,
                      // textColor: Colors.white,
                      icon: Icon(
                        Icons.cancel,
                        // color: Colors.white,
                      ),
                      title: "Decline",
                      width: 140,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
