import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/style.dart';

import '../../../constants/colors.dart';
import '../../../data/parties_users.dart';
import '../../parties_order_history/views/parties_order_history_view.dart';

class PartiesInfoStaticListView extends StatelessWidget {
  const PartiesInfoStaticListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: partiesUsers.length,
      itemBuilder: (BuildContext context, index) {
        final party = partiesUsers[index];
        final location = party["Parties_location"][0];
        return GestureDetector(
          onTap: () {
            Get.to(PartiesOrderHistoryView(
              partyName: party["Parties_name"],
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.lightSilver,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    party["Parties_name"],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16),
                      const SizedBox(width: 8.0),
                      Text(party["Parties_number"]),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 16),
                      const SizedBox(width: 8.0),
                      Text(party["Parties_email"]),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "VAT/PAN:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${party["Parties_VAT"]}",
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Location:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${location['town']}, ${location['District']}, ${location['State']}, ${location['Country']}",
                  ),
                  Text(
                    "View",
                    style: smallStyle.copyWith(color: Colors.blue),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
