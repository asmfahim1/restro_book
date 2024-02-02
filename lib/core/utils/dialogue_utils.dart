import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/utils/exports.dart';
import 'package:restro_book/core/widgets/exports.dart';

class DialogUtils {
  static void showLoading({String title = "Loading..."}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: allPadding15,
          child: SizedBox(
            height: Dimensions.height40,
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.width20,
                ),
                const Center(
                  child: SpinKitCircle(
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void showMessageDialogue({
    String title = "Oops Error",
    String description = "Something went wrong ",
  }) {
    Get.dialog(
      Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: allPadding15,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                title,
                style: TextStyles.title16,
              ),
              SizedBox(height: Dimensions.height10),
              TextWidget(
                description,
                style: TextStyles.regular14,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text("Okay"),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void showSnackBar(String messageTitle, String messageBody) {
    Get.snackbar(
      messageTitle,
      messageBody,
      icon: const Icon(Icons.person, color: Colors.white),
      borderWidth: 1.5,
      borderColor: Colors.black54,
      colorText: Colors.white,
      backgroundColor: greenColor,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
    );
  }
}
