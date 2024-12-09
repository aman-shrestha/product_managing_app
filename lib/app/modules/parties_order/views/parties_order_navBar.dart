// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/style.dart';
import '../../reusable_widgets/large_button_reusable.dart';

class PartiesOrderNavBar extends StatelessWidget {
  const PartiesOrderNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.h(23),
      decoration: const BoxDecoration(
        color: AppColors.lightSilver,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 10,
        //     offset: Offset(0, -2),
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Summary",
              style: smallStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const DashboardPartiesBottomnavbarReusableRow(
              title: 'Price',
              subtitle: 'Rs,1000',
            ),
            const SizedBox(height: 5),
            const DashboardPartiesBottomnavbarReusableRow(
              title: 'Shipping Charge',
              subtitle: 'Rs,100',
            ),
            const SizedBox(height: 5),
            const DashboardPartiesBottomnavbarReusableRow(
              title: 'Total Price',
              subtitle: 'Rs,1,100',
            ),
            const SizedBox(height: 20),
            const LargeButtonReusable(title: "Proceed To Payment")
          ],
        ),
      ),
    );
  }
}

class DashboardPartiesBottomnavbarReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const DashboardPartiesBottomnavbarReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: smallStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: smallStyle,
        ),
      ],
    );
  }
}
