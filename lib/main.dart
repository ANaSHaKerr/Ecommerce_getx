import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_shop_app/language/localiztion.dart';
import 'package:udemy_shop_app/logic/controllers/theme_controller.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/my_string.dart';
import 'package:udemy_shop_app/utils/theme.dart';

import 'logic/bindings/main_binding.dart';
import 'logic/controllers/cart_controller.dart';
import 'logic/controllers/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController());
  Get.put(SettingController());

  await GetStorage.init();
  await Firebase.initializeApp();
  initSettings().then((_) {
  runApp(const MyApp());
  });
}
Future<void> initSettings() async {
  await Settings.init(
    cacheProvider: SharePreferenceCache(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.routes,
    );
  }
}
