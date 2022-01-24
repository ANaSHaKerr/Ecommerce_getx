import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _hotelDetailBuilder(),
              _btnBuilder(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hotelDetailBuilder() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Center(
                child:Lottie.asset('assets/welcome.json',
                  height: 130.0,
                  width: 130
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextUtils(
              text: 'E-Commerce',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(
              height: 5.0,
            ),

            TextUtils(
              text: 'Best Products you will find ever',
              color: Colors.white,
              fontSize: 16,
            ),

          ],
        ),
      ),
    );
  }

  Widget _btnBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 12,
                )),
            onPressed: () {
              Get.offNamed(Routes.loginScreen);
            },
            child: TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: 'Get Start',
              color: Colors.white,
              underLine: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                text: "Don't have an Account?",
                color: Colors.white,
                underLine: TextDecoration.none,
              ),
              TextButton(
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
                child: TextUtils(
                  text: 'Sign Up',
                  color: mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/screens/auth/login_screen.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        text: 'Welcome',
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: "Asroo",
                          color: mainColor,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          text: "Shop",
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/


