import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/user_leave/views/user_leave_request_container.dart';
import 'package:product_ordering_app/app/modules/user_leave/views/user_leave_view_status.dart';
import '../../reusable_widgets/user_info_container.dart';
import '../controllers/user_leave_controller.dart';

class UserLeaveView extends GetView<UserLeaveController> {
  const UserLeaveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Leave Request'),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                backgroundColor: Colors.white,
                context: context,
                showDragHandle: true,
                builder: (BuildContext context) {
                  return const UserLeaveViewStatus();
                },
              );
            },
            child: Text(
              "View Status",
              style: smallStyle.copyWith(color: Colors.blue),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfoContainer(),
              const SizedBox(height: 20),
              UserLeaveRequestContainer(),
              const SizedBox(height: 20),
              const LargeButtonReusable(title: "Submit")
            ],
          ),
        ),
      ),
    );
  }
}
