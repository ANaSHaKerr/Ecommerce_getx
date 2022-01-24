import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/utils/theme.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;
  CartProductCard({
    required this.productModels,
    required this.index,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
      height: 160,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 100,
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(productModels.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModels.title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.removeProductsFarmCart(productModels);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      "$quantity",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.removeOneProduct(productModels);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 22,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
