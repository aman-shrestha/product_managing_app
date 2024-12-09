import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../controllers/user_leave_controller.dart';

class UserLeaveRequestContainer extends StatelessWidget {
  final desController = TextEditingController();
  final userLeave = Get.put(UserLeaveController());
  final List<String> _list = [
    'Annual Leave',
    'Sick Leave',
    'Paid Leave',
    'Casual Leave',
  ];
  UserLeaveRequestContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Leave Request",
            style: smallStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("From:"),
              Text("To:"),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.calendar_month),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(3000),
                  );

                  if (picked != null) {
                    // Update the selected date in the controller
                    userLeave.selectedDateFrom.value = picked;
                  }
                },
                child: Obx(() {
                  // Use Obx to reactively update the Text widget when the selected date changes
                  return Text(
                    userLeave.selectedDateFrom.value == null
                        ? "Select Date"
                        : "${userLeave.selectedDateFrom.value!.toLocal()}"
                            .split(' ')[0],
                  );
                }),
              ),
              const Spacer(),
              const Icon(Icons.calendar_month),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(3000),
                  );

                  if (picked != null) {
                    // Update the selected date in the controller
                    userLeave.selectedDateTo.value = picked;
                  }
                },
                child: Obx(() {
                  // Use Obx to reactively update the Text widget when the selected date changes
                  return Text(
                    userLeave.selectedDateTo.value == null
                        ? "Select Date"
                        : "${userLeave.selectedDateTo.value!.toLocal()}"
                            .split(' ')[0],
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Type Of Leave",
            style: smallStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          CustomDropdown<String>(
            hintText: 'Select Leave',
            items: _list,
            initialItem: _list[0],
            onChanged: (value) {
              // log('changing value to: $value');
            },
          ),
          const SizedBox(height: 20),
          Text(
            "Reason For Leave",
            style: smallStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: desController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              constraints: BoxConstraints.expand(height: 300, width: 400),
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
        ],
      ),
    );
  }
}
