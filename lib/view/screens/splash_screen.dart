import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(seconds: 4), () {
      FirebaseAuth.instance.currentUser != null ||
          GetStorage().read<bool>('auth') == true
          ? Get.offNamed(Routes.mainScreen)
      : Get.offNamed(Routes.welcomeScreen);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.grey[800]:mainColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 400,
                child: Lottie.asset('assets/intro.json')),
            SizedBox(
              width: 200.0,
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor:mainColor,
                child:  TextUtils(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  text: 'E-Commerce App',
                  color: Get.isDarkMode ? Colors.white : Colors.white,
                  underLine: TextDecoration.none,
                  textAlign: TextAlign.center,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}