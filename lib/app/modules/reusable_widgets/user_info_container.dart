import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/style.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.lightSilver,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserInfoContainerReusableColumn(
                title: "Employee Name:",
                subtitle: "Aman Shrestha",
              ),
              UserInfoContainerReusableColumn(
                title: "Employee ID:",
                subtitle: "123456789",
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserInfoContainerReusableColumn(
                title: "Job Position:",
                subtitle: "Sales Person",
              ),
              UserInfoContainerReusableColumn(
                title: "Status:",
                subtitle: "",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserInfoContainerReusableColumn extends StatelessWidget {
  final String title;
  final String subtitle;
  const UserInfoContainerReusableColumn(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: smallStyle.copyWith(color: AppColors.silver),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: smallStyle.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
