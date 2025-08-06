import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/styles/sectionseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import '../address/address_screen.dart';
import 'package:a_store/features/personalization/screens/payments/payment_methods_screen.dart';
import 'package:a_store/features/personalization/widgets/settings/mysettings_menu_tile.dart';
import 'package:a_store/features/personalization/widgets/profile/myuser_tile.dart';
import 'package:a_store/features/shop/screens/cart/cart_screen.dart';
import 'package:a_store/features/shop/screens/orders/orders_screen.dart';
import 'package:a_store/features/shop/widgets/home/home_header.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch account setting items from the repository

    final settingsController = SettingsController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Home header with app bar and user tile
            MyHomeHeader(
              child: Column(
                children: [
                  MyAppBar(
                    showBackButton: false,
                    title: Text(S.current.account,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: MyColors.white)),
                  ),
                  const MyUserTile(),
                  Sectionseparator.verticalSeparator(),
                ],
              ),
            ),
            // Padding for the main content of the screen
            Padding(
              padding: const EdgeInsets.all(MyDimensions.defultSpacing),
              child: Column(
                children: [
                  // Account Settings Section
                  MySectionHeading(
                    title: S.current.accountSettings,
                    showActionButton: false,
                  ),
                  ItemSeparator.verticalSeparator(),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      MySettingsMenuTile(
                        icon: Iconsax.safe_home,
                        title: S.current.myAddresses,
                        subtitle: S.current.setShoppingDeliveryAddress,
                        onTap: () => Get.to(() => const AddressScreen()),
                      ),
                      MySettingsMenuTile(
                        icon: Iconsax.shopping_cart,
                        title: S.current.myCart,
                        subtitle: S.current.addRemoveProductsMoveToCheckout,
                        onTap: () => Get.to(() => const CartScreen()),
                      ),
                      MySettingsMenuTile(
                        icon: Iconsax.bag_tick,
                        title: S.current.myOrders,
                        subtitle: S.current.inProgressAndCompletedOrders,
                        onTap: () => Get.to(() => const OrdersScreen()),
                      ),
                      MySettingsMenuTile(
                        icon: Iconsax.bank,
                        title: S.current.creditCards,
                        subtitle: S.current.withdrawBalanceToBank,
                        onTap: () => Get.to(() => const PaymentMethodsScreen()),
                      ),
                      MySettingsMenuTile(
                        icon: Iconsax.discount_shape,
                        title: S.current.myCoupons,
                        subtitle: S.current.listOfDiscountedCoupons,
                      ),
                      MySettingsMenuTile(
                        icon: Iconsax.notification,
                        title: S.current.notifications,
                        subtitle: S.current.setNotificationMessages,
                      ),
                      MySettingsMenuTile(
                        icon: Iconsax.security_card,
                        title: S.current.accountPrivacy,
                        subtitle: S.current.manageDataUsage,
                      ),
                    ],
                  ),
                  ItemSeparator.verticalSeparator(),
                  // App Settings Section
                  MySectionHeading(
                    title: S.current.appSettings,
                    showActionButton: false,
                  ),
                  ItemSeparator.verticalSeparator(),
                  Obx(
                    () => ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        MySettingsMenuTile(
                          icon: Iconsax.language_circle,
                          title: S.current.language,
                          subtitle: S.current.setYourPreferredLanguage,
                          trailing: DropdownButton<String>(
                            value: settingsController.language.value,
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Iconsax.arrow_down5),
                            ),
                            elevation: 16,
                            style: Theme.of(context).textTheme.bodyMedium,
                            underline: Container(
                              height: 2,
                              color: MyColors.primaryColor,
                            ),
                            onChanged: (String? newValue) {
                              settingsController.cahngeLanguage(newValue!);
                            },
                            items: <String>['en', 'ar', 'de']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        MySettingsMenuTile(
                          icon: Iconsax.language_circle,
                          title: S.current.theme,
                          subtitle: S.current.chooseYourPreferredTheme,
                          trailing: DropdownButton<String>(
                            value: settingsController.theme.value,
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Iconsax.arrow_down5),
                            ),
                            elevation: 16,
                            style: Theme.of(context).textTheme.bodyMedium,
                            underline: Container(
                              height: 2,
                              color: MyColors.primaryColor,
                            ),
                            onChanged: (String? newValue) {
                              settingsController.toggletheme(newValue!);
                            },
                            items: <String>[
                              "light",
                              "dark",
                              "system",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        MySettingsMenuTile(
                          icon: Iconsax.location,
                          title: S.current.geolocation,
                          subtitle: S.current.setRecommendationBasedOnLocation,
                          trailing: Switch(
                            value: settingsController.geoLocation.value,
                            onChanged: (value) {
                              settingsController.toggleGeoLocation(value);
                            },
                          ),
                        ),
                        MySettingsMenuTile(
                          icon: Iconsax.notification,
                          title: S.current.notifications,
                          subtitle: S.current.enableNotifications,
                          trailing: Switch(
                            value: settingsController.notifications.value,
                            onChanged: (value) {
                              settingsController.toggleNotifications(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ItemSeparator.verticalSeparator(),
                  // Sign out button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.signOut(),
                      child: Text(S.current.signOut,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
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
