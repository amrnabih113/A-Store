import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/features/personalization/controllers/user_controller.dart';
import 'package:a_store/features/shop/controllers/cart_controller.dart';
import 'package:a_store/features/shop/screens/cart/cart_screen.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final controller = Get.put(UserController());
    final networkImage = controller.user.value.profilePictutre;
    final image = networkImage.isNotEmpty ? networkImage : MyImages.user;
    return MyAppBar(
      showBackButton: false,
      title: Row(
        children: [
          controller.profileLoading.value
              ? const MyShimmerEffect(width: 40, height: 40, radius: 100)
              : MyRoundImageContainer(
                  height: 40,
                  width: 40,
                  borderRadious: 100,
                  fit: BoxFit.cover,
                  image: image,
                  isNetworkImage: networkImage.isNotEmpty,
                ),
          ItemSeparator.halfHorizontalSeparator(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              S.current.homeAppBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: MyColors.grey),
            ),
            Obx(
              () => controller.profileLoading.value
                  ? const Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        MyShimmerEffect(
                          height: 20,
                          width: 120,
                          radius: 10,
                        ),
                      ],
                    )
                  : Text(controller.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: MyColors.white)),
            )
          ]),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(MyDimensions.sm),
          child: Obx(
            () => Badge(
              alignment: Alignment.topRight,
              label: Text(cartController.noOfItems.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .apply(color: MyColors.white)),
              backgroundColor: MyColors.dark,
              child: IconButton(
                onPressed: () => Get.to(() => const CartScreen()),
                icon: const Icon(
                  Iconsax.shopping_bag,
                  color: MyColors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
