import 'package:about/about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/auth_controller.dart';
import 'package:udemy_shop_app/logic/controllers/settings_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/setting/dark_mode_widget.dart';
import 'package:udemy_shop_app/view/widgets/setting/language_widget.dart';
import 'package:udemy_shop_app/view/widgets/setting/logout_widget.dart';
import 'package:udemy_shop_app/view/widgets/setting/tile_button.dart';


class SettingScreen extends StatelessWidget {
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();
  var userUid;
  var userEmail = 'exemple@gmail.com';
  var userName = 'Full Name';
  var userImage = '';
  bool userIsLogIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey[800]:Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  CircleAvatar(
                    maxRadius: 36.0,
                    backgroundColor: darkGreyClr,
                    child: CircleAvatar(
                      maxRadius: 34.0,
                      backgroundColor: mainColor,
                      backgroundImage: authController.displayUserPhoto.value != ''
                          ? NetworkImage('$authController.displayUserPhoto.value')
                          : AssetImage('assets/images/avatar.png') as ImageProvider,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        authController.displayUserName.value !='' ? authController.displayUserName.value : '$userName',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        authController.displayUserEmail.value !='' ? authController.displayUserEmail.value : '$userEmail',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ],
                  ),
                  Spacer(),

                ],
              ),
            ),
            Expanded(
              child: Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DarkModeWidget(),
                      LanguageWidget(),

                      TileButton(
                        icon: FontAwesomeIcons.questionCircle,
                        label: 'Help!?'.tr,
                        onPress: () {
                          // Navigator.pushNamed(context, '/help_screen');
                        },
                      ),
                      TileButton(
                        icon: FontAwesomeIcons.addressCard,
                        label: 'About us'.tr,
                        onPress: () {
                          showAboutPage(
                            context: context,
                            applicationLegalese:
                            'Copyright © Azul Mouàd, {{ 2020-07-10 }}',
                            applicationDescription: Text("kDescripABout"),
                            children: <Widget>[
                              LicensesPageListTile(
                                icon: Icon(FontAwesomeIcons.userShield),
                                values: {},
                              ),
                              ListTile(
                                leading: Icon(FontAwesomeIcons.shoppingBag),
                                title: Text('Buy this app'),
                                onTap: () async {

                                },
                              ),
                              ListTile(
                                leading:
                                Icon(FontAwesomeIcons.solidEnvelopeOpen),
                                title: Text('Contact Developer'.tr),
                                onTap: () async {

                                },
                              ),
                            ],
                            applicationIcon: SizedBox(
                              width: 200,
                              height: 200,
                              child: SvgPicture.asset('images/soccer.svg'),
                            ),
                          );
                        },
                      ),
                      TileButton(
                        icon: FontAwesomeIcons.whatsapp,
                        label: 'Contact us'.tr,
                        onPress: () async {
                        },
                      ),
                      TileButton(
                        icon: FontAwesomeIcons.userShield,
                        label: 'Privacy Policy'.tr,
                        onPress: () async {
                        },
                      ),
                      TileButton(
                        icon: FontAwesomeIcons.heartbeat,
                        label: 'Rate App'.tr,
                        onPress: () async {
                        },
                      ),
                      TileButton(
                        icon: FontAwesomeIcons.shareAlt,
                        label: 'Share App'.tr,
                        onPress: () async {

                        },
                      ),
                      LogOutWidget(),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}