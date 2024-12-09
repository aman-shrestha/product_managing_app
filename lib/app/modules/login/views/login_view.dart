import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/parties_navBar/views/parties_nav_bar_view.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/text_form_field_reusable.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final email = TextEditingController();
  final password = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x000000ff),
              // AppColors.primaryColor, // Replace with your gradient start color
              AppColors.lightBlue, // Replace with your gradient end color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.box,
                  size: 50,
                  // color: Colors.white,
                  color: AppColors.textColorGrey,
                ),
                const SizedBox(height: 10),
                const Text("Product Ordering App",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textColorGrey,
                      // color: Colors.white,
                    )
                    // smallStyle.copyWith(
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.white,
                    // ),
                    ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.shade300,
                      //     blurRadius: 10,
                      //     offset: const Offset(0, 5),
                      //   ),
                      // ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome Back",
                          style: normalStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Log in to continue",
                          style: smallStyle.copyWith(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormFieldReusable(
                          hint: "Email",
                          textEditingController: email,
                        ),
                        const SizedBox(height: 16),
                        TextFormFieldReusable(
                          hint: "Password",
                          textEditingController: password,
                          isObscure: true,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.check_box),
                                // const Icon(
                                //   Icons.check_box_outline_blank,
                                //   size: 20,
                                // ),
                                const SizedBox(width: 8),
                                Text(
                                  "Remember Me",
                                  style: smallStyle.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/forgot-password');
                              },
                              child: Text(
                                "Forgot Password?",
                                style: smallStyle.copyWith(
                                  color: AppColors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        LargeButtonReusable(
                          title: "Log In",
                          onTap: () {
                            Get.to(PartiesNavBarView());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class LoginView extends GetView<LoginController> {
//   final email = TextEditingController();
//   final password = TextEditingController();
//   LoginView({super.key});
//   @override
//   Widget build(BuildContext context) => KeyboardDismisser(
//         child: Scaffold(
//           // backgroundColor: Color(0xffF3EEF4),
//           backgroundColor: AppColors.lightSilver,
//           body: Padding(
//             padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//             child: Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   color: Colors.white,
//                 ),
//                 height: 500,
//                 child: Flexible(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Product Ordering App",
//                           style:
//                               normalStyle.copyWith(fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 40),
//                         TextFormFieldReusable(
//                           hint: "Username",
//                           textEditingController: email,
//                         ),
//                         const SizedBox(height: 20),
//                         TextFormFieldReusable(
//                           hint: "password",
//                           textEditingController: password,
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             const Icon(Icons.check_box),
//                             Text(
//                               "Remember Me",
//                               style: smallStyle,
//                             ),
//                             const Spacer(),
//                             GestureDetector(
//                               onTap: () {
//                                 Get.toNamed('/forgot-password');
//                               },
//                               child: Text(
//                                 "Forgot Password ?",
//                                 style:
//                                     smallStyle.copyWith(color: AppColors.red),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 40),
//                         LargeButtonReusable(
//                           title: "Log In",
//                           onTap: () {
//                             // Get.to(UserAttendanceView());
//                             // Get.to(UserLeaveView());
//                             // Get.to(UserOrderView());
//                             // Get.to(CreateOrder());
//                             // Get.to(PartiesInfoView());
//                             // Get.to(AddPartiesView());
//                             // Get.to(UserDashboardView());
//                             Get.to(PartiesNavBarView());
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
// }
