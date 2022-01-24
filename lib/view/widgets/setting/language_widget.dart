import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/settings_controller.dart';
import 'package:udemy_shop_app/utils/my_string.dart';
import 'package:udemy_shop_app/utils/theme.dart';

import '../text_utils.dart';
import 'tile_button.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TileButton(
            icon: Icons.language,
            label: "Language".tr,
            onPress: () {
              // Navigator.pushNamed(context, '/help_screen');
            },
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 120,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  width: 2,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 25,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        english,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      value: ene,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        arabic,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: ara,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        france,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      value: frf,
                    ),
                  ],
                  value: controller.langLocal,
                  onChanged: (value) {
                    controller.changeLanguage(value!);
                    Get.updateLocale(Locale(value));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
