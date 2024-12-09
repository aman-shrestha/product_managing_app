import 'package:flutter/material.dart';

class CheckBoxReusable extends StatelessWidget {
  final bool valueCheckbox;
  final void Function() checkboxFunc;
  const CheckBoxReusable(
      {super.key, required this.valueCheckbox, required this.checkboxFunc});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      tristate: true,
      value: valueCheckbox,
      onChanged: (bool? value) {
        checkboxFunc();
      },
    );
  }
}
