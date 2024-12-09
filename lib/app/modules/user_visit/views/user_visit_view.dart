import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import '../../../constants/colors.dart';
import '../../../data/visit_location.dart';
import '../../reusable_widgets/user_search_reusable.dart';
import '../controllers/user_visit_controller.dart';

class UserVisitView extends GetView<UserVisitController> {
  final List<String> _list = [
    'Metting',
    'Product Pick Up',
    'Other',
  ];
  final visitTime = TextEditingController();
  final visitpurpose = TextEditingController();
  final searchLocation = TextEditingController();
  final userVisit = Get.put(UserVisitController());
  UserVisitView({super.key});
  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      if (query.isEmpty) {
        userVisit.searchLocationResult.value = [];
      } else {
        // Filter data based on search query
        List filteredData = visitLocation
            .where((element) => element['visit_location_name']!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        userVisit.searchLocationResult.value = filteredData;
      }
    }

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Visit'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     Text(
                //       "Visit Status:",
                //       style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                //     ),
                //     const SizedBox(width: 20),
                //     Container(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 12, vertical: 8),
                //       decoration: BoxDecoration(
                //         color: AppColors.lightSilver, // Light background
                //         borderRadius: BorderRadius.circular(16),
                //         border: Border.all(
                //             color: AppColors.lightSilver, width: 1.5),
                //       ),
                //       child: Text(
                //         "PENDING",
                //         style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 20),
                Text(
                  "Add User:",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // PartySearchReusable(),
                UserSearchReusable(),
                const SizedBox(height: 20),
                Text(
                  "Visit Date:",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
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
                          userVisit.selectedVisitDate.value = picked;
                        }
                      },
                      child: Obx(() {
                        // Use Obx to reactively update the Text widget when the selected date changes
                        return Text(
                          userVisit.selectedVisitDate.value == null
                              ? "Select Date"
                              : "${userVisit.selectedVisitDate.value!.toLocal()}"
                                  .split(' ')[0],
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    // final TimeOfDay? time = await showTimePicker(
                    //     context: context,
                    //     initialTime: TimeOfDay.now(),
                    //     initialEntryMode: TimePickerEntryMode.input);
                  },
                  child: Text(
                    "Visit Time:",
                    style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: visitTime,
                  decoration: const InputDecoration(
                    labelText: 'Enter Time (HOUR:MINUMTE)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9:]')),
                    LengthLimitingTextInputFormatter(5),
                    TimeInputFormatter(),
                    // You can use a time input formatter here if needed
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Select Visit Location:",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Click Search Result To Add Location",
                  style: smallStyle.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.red),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: searchLocation,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Search For Visit Location...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                  onChanged: (value) => searchQuery(value),
                ),
                Obx(
                  () => userVisit.searchLocationResult.isNotEmpty
                      ? Container(
                          constraints: const BoxConstraints(maxHeight: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: userVisit.searchLocationResult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  //LOGIC FOR ADDING MULTIPLE USER
                                  // createOrder.partiesList.add(
                                  //   {
                                  //     "Parties_id": searchResult[index]["Parties_id"],
                                  //     "Parties_name": searchResult[index]
                                  //         ["Parties_name"],
                                  //     "Parties_location": searchResult[index]
                                  //         ["Parties_location"]
                                  //   },
                                  // );

                                  searchLocation.text =
                                      userVisit.searchLocationResult[index]
                                          ["visit_location_name"];
                                  userVisit.searchLocationResult.value = [];
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on,
                                              color: AppColors.green),
                                          const SizedBox(width: 10),
                                          Text(
                                              '${userVisit.searchLocationResult[index]["visit_location_name"]} ',
                                              style: smallStyle),
                                          const Spacer(),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      // Row(
                                      //   children: [
                                      //     const Icon(Icons.location_on,
                                      //         color: Colors.green),
                                      //     const SizedBox(width: 10),
                                      //     Expanded(
                                      //       child: Text(
                                      //         '${searchResult[index]["Parties_location"][0]["State"]},'
                                      //         '${searchResult[index]["Parties_location"][0]["District"]},'
                                      //         '${searchResult[index]["Parties_location"][0]["town"]}',
                                      //         style: miniStyle.copyWith(
                                      //           overflow: TextOverflow.ellipsis,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 20),
                Text(
                  "Visit Purpose:",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomDropdown<String>(
                  decoration: CustomDropdownDecoration(
                      closedBorder: Border.all(color: Colors.black)),
                  hintText: 'Select Leave',
                  items: _list,
                  initialItem: _list[0],
                  onChanged: (value) {
                    // log('changing value to: $value');
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Remarks:",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: visitpurpose,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: AppColors.lightSilver,
                    constraints: BoxConstraints.expand(
                      height: 200,
                    ),
                    hintText: 'Write Here ....',
                    // border: inputBorder,
                    // focusedBorder: inputBorder,
                    // enabledBorder: inputBorder,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  maxLength: 250,
                  maxLines: 50,
                ),
                const SizedBox(height: 40),
                const LargeButtonReusable(title: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    if (text.length == 2 && !text.contains(':')) {
      return TextEditingValue(
        text: '$text:',
        selection: const TextSelection.collapsed(offset: 3),
      );
    } else if (text.length > 5) {
      return oldValue; // Prevent entering more than 5 characters (HH:MM)
    }

    return newValue;
  }
}
