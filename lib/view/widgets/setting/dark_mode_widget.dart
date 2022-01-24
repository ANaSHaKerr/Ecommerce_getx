import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/settings_controller.dart';
import 'package:udemy_shop_app/logic/controllers/theme_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

import 'tile_button.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TileButton(
            icon: Icons.dark_mode,
            label: "Dark Mode".tr,
            onPress: () {
              // Navigator.pushNamed(context, '/help_screen');
            },
          ),
          Switch(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            value: controller.swithchValue.value,
            onChanged: (value) {
              ThemeController().changesTheme();
              controller.swithchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

}
