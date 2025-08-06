import 'package:a_store/binding/general_binding.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingController = Get.put(SettingsController());
    return Obx(() {
      final lang = settingController.language.value;
      return GetMaterialApp(
        locale: Locale(lang),
        localizationsDelegates: const [
          S.delegate, // Ensure this is included for localization
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialBinding: GeneralBinding(),
        debugShowCheckedModeBanner: false,
        themeMode: settingController.theme.value == "system"
            ? ThemeMode.system
            : settingController.theme.value == "dark"
                ? ThemeMode.dark
                : ThemeMode.light,
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
        home: const Scaffold(
          backgroundColor: MyColors.primaryColor,
          body: Center(
            child: CircularProgressIndicator(
              color: MyColors.white,
            ),
          ),
        ),
      );
    });
  }
}
