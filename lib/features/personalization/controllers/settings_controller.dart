import 'dart:ui';

import 'package:a_store/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  RxBool geoLocation = false.obs;
  RxString theme = S.current.light.obs;
  RxBool notifications = false.obs;
  RxString language = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    geoLocation.value = GetStorage().read('geoLocation') ?? false;
    theme.value = GetStorage().read('theme') ?? S.current.light;
    notifications.value = GetStorage().read('notifications') ?? false;
    language.value = GetStorage().read('language') ?? 'en';
  }

  void cahngeLanguage(String value) {
    language.value = value;
    GetStorage().write("language", language.value);
    Get.updateLocale(Locale(value));
  }

  void toggletheme(String value) {
    theme.value = value;
    GetStorage().write("theme", theme.value);
  }

  void toggleNotifications(bool value) {
    notifications.value = value;
    GetStorage().write("notifications", notifications.value);
  }

  void toggleGeoLocation(bool value) {
    geoLocation.value = value;
    GetStorage().write("geoLocation", geoLocation.value);
  }

   bool isArabic() {
    return GetStorage().read('language') == 'ar';
  }
}
