import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/auth_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';

import '../text_utils.dart';
import 'tile_button.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => TileButton(
        icon: Icons.logout,
        label: "Logout".tr,
        onPress: () {
          Get.defaultDialog(
            title: "Logout From App",
            titleStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Are you sure you need to logout',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textCancel: " No ",
            cancelTextColor: Colors.white,
            textConfirm: " YES ",
            confirmTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              controller.signOutFromApp();
            },
            buttonColor: Get.isDarkMode ? pinkClr : mainColor,
          );
        },
      )
    );
  }
}
