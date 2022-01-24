
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/view/widgets/Default_Button.dart';
import 'package:udemy_shop_app/view/widgets/payment/Empty_sec.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);


  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: "assets/images/success.gif",
            emptyMsg: 'Successful !!',
          ),
          SizedBox(
            height: 10,
          ),
          TextUtils(
            text: 'Your payment was done successfully',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 20,
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () =>  Get.offNamed(Routes.mainScreen)

          ),
        ],
      ),
    );
  }
}