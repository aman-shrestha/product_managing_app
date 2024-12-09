import 'package:flutter/material.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';

class UserLeaveViewStatus extends StatelessWidget {
  const UserLeaveViewStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.lightSilver,
                ),
                child: const Column(
                  children: [
                    UserLeaveViewStatusReusableRow(
                      title: "Leave Status",
                      subtitle: "Pending",
                    ),
                    UserLeaveViewStatusReusableRow(
                      title: "From",
                      subtitle: "20/12/2024",
                    ),
                    UserLeaveViewStatusReusableRow(
                      title: "To",
                      subtitle: "30/12/2024",
                    ),
                    UserLeaveViewStatusReusableRow(
                      title: "Leave Type",
                      subtitle: "Sick Leave",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserLeaveViewStatusReusableRow extends StatelessWidget {
  final String title, subtitle;
  const UserLeaveViewStatusReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: smallStyle.copyWith(color: Colors.grey),
          ),
          SizedBox(
            width: 200,
            child: Text(
              subtitle,
              style: smallStyle,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
