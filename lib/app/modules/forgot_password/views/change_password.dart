import 'package:flutter/material.dart';
import 'package:product_ordering_app/app/constants/style.dart';

import '../../reusable_widgets/large_button_reusable.dart';
import '../../reusable_widgets/text_form_field_reusable.dart';

class ChangePassword extends StatelessWidget {
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Password",
                style: normalStyle,
              ),
              const SizedBox(height: 40),
              Text("Password",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormFieldReusable(
                isObscure: true,
                hint: 'Enter your password',
                icon: const Icon(Icons.password),
                textEditingController: password,
              ),
              const SizedBox(height: 10),
              Text(
                  "Min. 8 char, 1 upper & lowercase, a number & a special characte.",
                  style: smallStyle),
              const SizedBox(height: 20),
              Text("Confirm Password",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormFieldReusable(
                isObscure: true,
                hint: 'ReEnter your Password',
                icon: const Icon(Icons.password),
                textEditingController: confirmPassword,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {},
                child: const LargeButtonReusable(
                  title: "Submit",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
