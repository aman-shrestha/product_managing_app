import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';

class UserOrderHistoryInvoiceDetails extends StatefulWidget {
  const UserOrderHistoryInvoiceDetails({super.key});

  @override
  State<UserOrderHistoryInvoiceDetails> createState() =>
      _UserOrderHistoryInvoiceDetailsState();
}

class _UserOrderHistoryInvoiceDetailsState
    extends State<UserOrderHistoryInvoiceDetails> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: [
            _buildCard(
              title: "Invoice Info",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInvoiceDetail("Invoice ID", "5413"),
                  _buildInvoiceDetail("Placed Date", "2024, May 20"),
                  _buildInvoiceDetail("Estimated Date", "2024, May 25"),
                  _buildInvoiceDetail("Status", "Completed"),
                ],
              ),
            ),
            _buildCard(
              title: "Billed To",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.person, "Marry Smith"),
                  _buildInfoRow(Icons.email, "marrysmith@gmail.com"),
                  _buildInfoRow(Icons.phone, "9876543210"),
                  _buildInfoRow(Icons.location_on, "Kathmandu, Nepal"),
                ],
              ),
            ),
            _buildCard(
              title: "Sales Person Info",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.person, "John Doe"),
                  _buildInfoRow(Icons.email, "johndoe@gmail.com"),
                  _buildInfoRow(Icons.phone, "9876543211"),
                  _buildInfoRow(Icons.location_on, "Lalitpur, Nepal"),
                ],
              ),
            ),
          ],
          options: CarouselOptions(
            height: 210.0,
            enlargeCenterPage: true,
            autoPlay: false,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            // autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // Update the current slide index
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            // Number of slides
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: _currentIndex == index ? 16.0 : 8.0,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          }),
        ),
      ],
    );
  }
  // Column(
  //   crossAxisAlignment: CrossAxisAlignment.stretch,
  //   children: [
  //     const SizedBox(height: 20),
  //     _buildCard(
  //       title: "Invoice Info",
  //       content: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           _buildInvoiceDetail("Invoice ID", "5413"),
  //           _buildInvoiceDetail("Placed Date", "2024, May 20"),
  //           _buildInvoiceDetail("Estimated Date", "2024, May 25"),
  //           _buildInvoiceDetail("Status", "Completed"),
  //         ],
  //       ),
  //     ),
  //     _buildCard(
  //       title: "Billed To",
  //       content: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           _buildInfoRow(Icons.person, "Marry Smith"),
  //           _buildInfoRow(Icons.email, "marrysmith@gmail.com"),
  //           _buildInfoRow(Icons.phone, "9876543210"),
  //           _buildInfoRow(Icons.location_on, "Kathmandu, Nepal"),
  //         ],
  //       ),
  //     ),
  //     // const SizedBox(height: 16),
  //     _buildCard(
  //       title: "Sales Person Info",
  //       content: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           _buildInfoRow(Icons.person, "John Doe"),
  //           _buildInfoRow(Icons.email, "johndoe@gmail.com"),
  //           _buildInfoRow(Icons.phone, "9876543211"),
  //           _buildInfoRow(Icons.location_on, "Lalitpur, Nepal"),
  //         ],
  //       ),
  //     ),
  //     const SizedBox(height: 16),
  //   ],
  // );

  Widget _buildCard({required String title, required Widget content}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.lightSilver,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: smallStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.silver),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: smallStyle.copyWith(color: AppColors.silver),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: smallStyle.copyWith(color: AppColors.silver),
          ),
          Text(
            value,
            style: smallStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
