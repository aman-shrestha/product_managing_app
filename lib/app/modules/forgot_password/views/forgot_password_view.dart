import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/forgot_password/views/otp_view.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';

import '../../reusable_widgets/text_form_field_reusable.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  final forgotPassword = TextEditingController();
  ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(''),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Forgot Password", style: normalStyle),
                const SizedBox(height: 40),
                Text("Email", style: smallStyle
                    // TextStyle(
                    //     fontSize: TextSize.small,
                    //     color: AppColors.titleColorGrey,
                    //     fontWeight: FontWeight.w500),
                    ),
                const SizedBox(height: 10),
                TextFormFieldReusable(
                  hint: "your_email@gmail.com",
                  icon: const Icon(
                    Icons.mail,
                  ),
                  isObscure: true,
                  textEditingController: forgotPassword,
                ),
                const SizedBox(height: 40),
                LargeButtonReusable(
                    onTap: () {
                      Get.to(const OTPView());
                    },
                    title: "Submit")
              ],
            ),
          ),
        ),
      );
}
