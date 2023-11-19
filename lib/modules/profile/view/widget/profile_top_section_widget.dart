import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restro_book/core/utils/dimensions.dart';
import 'package:restro_book/core/widgets/exports.dart';
import 'package:restro_book/modules/profile/controller/profile_controller.dart';

import '../../../../core/utils/exports.dart';

class ProfileTopSectionWidget extends StatelessWidget {
  final ProfileController controller;
  const ProfileTopSectionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height100 * 2.21,
      width: Dimensions.screenWidth,
      padding: allPadding15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Obx(() {
                return SizedBox(
                  height: Dimensions.height100 * 1.2,
                  width: Dimensions.width100 * 1.2,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius20 * 5),
                    child: controller.selectedImagePath.value.isNotEmpty
                        ? Image.file(
                            File(controller.selectedImagePath.value),
                            fit: BoxFit.cover,
                          )
                        : const Image(
                            image: AssetImage(profileImagePath),
                          ),
                  ),
                );
              }),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    showImagePickerOptions(context);
                  },
                  child: Container(
                    height: Dimensions.height35,
                    width: Dimensions.width35,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius20 * 5),
                    ),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: whiteColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextWidget(
            'Skylar Sophie',
            style: TextStyles.title20,
          ),
          TextWidget(
            'Member since August 2023',
          ),
          const SizedBoxHeight20(),
        ],
      ),
    );
  }

  Future<void> showImagePickerOptions(
    BuildContext context,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: Dimensions.heightScreenHalf * .8,
            width: Dimensions.screenWidth * .8,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        'Upload your photo',
                        style: TextStyles.title16,
                      ),
                      const SizedBoxHeight20(),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                        size: Dimensions.iconSize25 * 4,
                      ),
                      const SizedBoxHeight20(),
                      const SizedBoxHeight20(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.pickImage(ImageSource.camera);
                            },
                            child: Container(
                              height: Dimensions.height35,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(
                                  color: primaryColor,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: TextWidget(
                                'Open camera',
                                //style: TextStyles.title16,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.pickImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: Dimensions.height35,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(
                                  color: primaryColor,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: TextWidget(
                                'Open Gallery',
                                //style: TextStyles.title16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
