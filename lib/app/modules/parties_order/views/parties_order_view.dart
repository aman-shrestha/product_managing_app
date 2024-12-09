import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/parties_order/views/parties_order_listView.dart';
import 'package:product_ordering_app/app/modules/parties_order/views/parties_order_navBar.dart';

import '../../../constants/style.dart';
import '../controllers/parties_order_controller.dart';

class PartiesOrderView extends GetView<PartiesOrderController> {
  const PartiesOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Ordered Items'),
        ),
        centerTitle: false,
        actions: const [Icon(Icons.delete), SizedBox(width: 20)],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: PartiesOrderListView(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const PartiesOrderNavBar(),
    );
  }
}

class DashBoardPartiesReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const DashBoardPartiesReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: smallStyle.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subtitle,
          style: smallStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
