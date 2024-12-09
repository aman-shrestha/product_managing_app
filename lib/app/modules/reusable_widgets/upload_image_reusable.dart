import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors.dart';
import '../../constants/style.dart';

class UploadImageReusable extends StatelessWidget {
  const UploadImageReusable({super.key});

  @override
  Widget build(BuildContext context) {
    Future<XFile?> pickImage() async {
      final imagePicker = ImagePicker();
      try {
        final pickedFile =
            await imagePicker.pickImage(source: ImageSource.gallery);
        return pickedFile;
      } catch (e) {
        // Handle errors (e.g., user cancels selection, permission denied)
        return null;
      }
    }

    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.silver),
          borderRadius: BorderRadius.circular(12), // Add rounded corners
          color: Colors.white, // Optional: Add background color
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3), // Subtle shadow for depth
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              const Icon(
                Icons.image,
                size: 80, // Slightly smaller icon size
                color: Colors.grey, // Add a neutral color
              ),
              const SizedBox(height: 16), // Reduced spacing
              Text(
                "Upload Image",
                style: smallStyle.copyWith(
                  fontWeight: FontWeight.w600, // Subtle boldness
                  fontSize: 16, // Slightly larger font size
                  color: Colors.black87, // Professional color tone
                ),
                textAlign: TextAlign.center, // Center-align text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
