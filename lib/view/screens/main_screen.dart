import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
import 'package:udemy_shop_app/logic/controllers/main_controller.dart';
import 'package:udemy_shop_app/routes/routes.dart';

import 'package:udemy_shop_app/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: controller.currentIndex.value == 3 ?null : AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                Obx(
                  () => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Image.asset('assets/images/shop.png'),
                    ),
                  ),
                ),
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text(controller.title[controller.currentIndex.value],
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              centerTitle: true,
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Get.isDarkMode ?Colors.grey.shade800 : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20, color:  Get.isDarkMode ?Colors.grey.shade700 :Colors.grey.shade300, spreadRadius: 1)
                    ]),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildContainerBottomNav(Icons.home,0),
                    buildContainerBottomNav(Icons.category,1),
                    buildContainerBottomNav(Icons.favorite,2, isSelected: true),
                    buildContainerBottomNav(Icons.shopping_cart,3),
                    buildContainerBottomNav(Icons.settings,4),
                  ],
                ),
              ),
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
  Widget buildContainerBottomNav(IconData icon, int index,{isSelected = false}) {
    return GestureDetector(
      onTap: () {
        controller.currentIndex.value = index;

      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Get.isDarkMode ?  Colors.pink[500]: Colors.green[500]
              : Get.isDarkMode ?Colors.grey.shade800 : Colors.white,
          shape: BoxShape.circle,
          boxShadow: isSelected
          ? [ BoxShadow(color:Get.isDarkMode ?  Colors.pink: Colors.green, blurRadius: 5, spreadRadius: 1)]
              : [],
        ),
        height: 70,
        width: 50,
        child: Icon(icon,
            color: index == controller.currentIndex.value ?Get.isDarkMode ? pinkClr: mainColor : Colors.grey,size: 26,),
      ),
    );
  }
}

