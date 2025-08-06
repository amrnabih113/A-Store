import 'package:a_store/features/personalization/controllers/addresses_controller.dart';
import 'package:a_store/features/personalization/screens/settings/settings_screen.dart';
import 'package:a_store/features/shop/screens/favourite/favourite_screen.dart';
import 'package:a_store/features/shop/screens/home/home_screen.dart';
import 'package:a_store/features/shop/screens/store/store_screen.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    Get.put(AddressesController());

    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: dark ? MyColors.black : MyColors.light,
            indicatorColor: dark
                ? MyColors.light.withOpacity(0.1)
                : MyColors.dark.withOpacity(0.1),
            destinations: [
              NavigationDestination(
                icon: const Icon(Iconsax.home),
                label: S.current.home,
              ),
              NavigationDestination(
                icon: const Icon(Iconsax.shop),
                label: S.current.store,
              ),
              NavigationDestination(
                icon: const Icon(Iconsax.heart),
                label: S.current.wishlist,
              ),
              NavigationDestination(
                icon: const Icon(Iconsax.user),
                label: S.current.profile,
              ),
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  static final NavigationController instance = Get.find();
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }

  final List<Widget> screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen()
  ];
}
