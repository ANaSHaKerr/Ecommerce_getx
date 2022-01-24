import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/category_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/category/category_items.dart';

import '../animated_widget.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isCatgeoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemExtent: 150,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimatedWidgets(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(25)),
                        child: Container(

                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(25),
                              image: DecorationImage(
                                image: NetworkImage(
                                  controller.imageCategory[index],
                                ),
                                fit: BoxFit.cover,
                                colorFilter: Theme.of(context)
                                    .brightness ==
                                    Brightness.dark
                                    ? ColorFilter.mode(
                                    Colors.grey.shade800
                                        .withOpacity(0.8),
                                    BlendMode.dstATop)
                                    : null,
                              )),
                          child: Text(
                            controller.categoryNameList[index].capitalizeFirst!,
                            style:const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        controller.getCategoryIndex(index);
                        Get.to(() => CategoryItems(
                          catehoryTitle: controller.categoryNameList[index],
                        ));
                      },
                    ),
                  ),
                  delay: 300,
                );
              },

              itemCount: controller.categoryNameList.length,
            ),
          );
        }
      },
    );
  }
}
