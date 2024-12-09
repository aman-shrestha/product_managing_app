import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/user_order_history/views/user_order_history_detail.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../user_leave/views/user_leave_view_status.dart';

class UserReturnViewStatus extends StatelessWidget {
  const UserReturnViewStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(UserOrderHistoryDetail());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.lightSilver,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const UserLeaveViewStatusReusableRow(
                              title: "ID",
                              subtitle: "AYG29",
                            ),
                            const UserLeaveViewStatusReusableRow(
                              title: "Return Status",
                              subtitle: "Pending",
                            ),
                            const UserLeaveViewStatusReusableRow(
                              title: "Party",
                              subtitle: "Ram",
                            ),
                            const UserLeaveViewStatusReusableRow(
                              title: "Issued Date",
                              subtitle: "20/12/2024",
                            ),
                            const UserLeaveViewStatusReusableRow(
                              title: "Reason",
                              subtitle: "Quality Concerns",
                            ),
                            // UserLeaveViewStatusReusableRow(
                            //   title: "Product",
                            //   subtitle:
                            //       "Vit's Instant Noodles Economy Slim 650g jksdafjklasjfklasjf",
                            // ),
                            const UserLeaveViewStatusReusableRow(
                              title: "Items",
                              subtitle: "4",
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "View Detail",
                                  style:
                                      smallStyle.copyWith(color: Colors.blue),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
