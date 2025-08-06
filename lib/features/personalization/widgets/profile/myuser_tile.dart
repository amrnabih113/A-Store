import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/features/personalization/controllers/user_controller.dart';
import 'package:a_store/features/personalization/screens/profile/profile_screen.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyUserTile extends StatelessWidget {
  const MyUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Obx(() {
      final networkImage = userController.user.value.profilePictutre;
      final image = networkImage.isNotEmpty ? networkImage : MyImages.user;
      return ListTile(
        title: userController.profileLoading.value
            ? const MyShimmerEffect(width: 120, height: 20, radius: 10)
            : Text(
                userController.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: MyColors.white),
              ),
        subtitle: userController.profileLoading.value
            ? const MyShimmerEffect(width: 200, height: 20, radius: 10)
            : Text(
                userController.user.value.email,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: MyColors.white),
              ),
        trailing: IconButton(
          onPressed: () => (Get.to(() => const ProfileScreen())),
          icon: const Icon(
            Iconsax.edit,
            color: MyColors.white,
          ),
        ),
        leading: userController.imageLoading.value
            ? const MyShimmerEffect(width: 80, height: 80, radius: 100)
            : MyRoundImageContainer(
                height: 80,
                width: 60,
                borderRadious: 100,
                fit: BoxFit.cover,
                image: image,
                isNetworkImage: networkImage.isNotEmpty,
              ),
      );
    });
  }
}
