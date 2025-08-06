import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/common/widgets/mybanner_container.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/personalization/controllers/user_controller.dart';
import 'package:a_store/features/personalization/screens/profile/edit_phone_number.dart';
import 'package:a_store/features/personalization/screens/profile/edit_username.dart';
import 'package:a_store/features/personalization/screens/profile/new_names.dart';
import 'package:a_store/features/personalization/widgets/profile/myprofile_menu_tile.dart';
import 'package:a_store/features/shop/controllers/products/images_controller.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:a_store/generated/l10n.dart'; // Add this for localization

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final imagesController = Get.put(ImagesController());
    return Scaffold(
        appBar: MyAppBar(
          title: Text(S.current.profile,
              style: Theme.of(context).textTheme.headlineMedium),
          showBackButton: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: SizedBox(
            width: double.infinity,
            child: Obx(
              () {
                final networkImage = userController.user.value.profilePictutre;
                final image =
                    networkImage.isNotEmpty ? networkImage : MyImages.user;
                return Column(children: [
                  userController.imageLoading.value
                      ? const MyShimmerEffect(
                          width: 80, height: 80, radius: 100)
                      : MyRoundImageContainer(
                          onTap: () => imagesController.showEnlargeImage(image,
                              isNetworkImage: networkImage.isNotEmpty),
                          height: 80,
                          width: 80,
                          borderRadious: 100,
                          fit: BoxFit.cover,
                          image: image,
                          isNetworkImage: networkImage.isNotEmpty,
                        ),
                  TextButton(
                      onPressed: () =>
                          userController.uploadUserProfilePicture(),
                      child: Text(S.current.changeProfilePhoto)),
                  ItemSeparator.halfVerticalSeparator(),
                  const Divider(),
                  ItemSeparator.verticalSeparator(),
                  MySectionHeading(
                      title: S.current.profileInformation,
                      showActionButton: false),
                  ItemSeparator.verticalSeparator(),
                  MyProfileMenuTile(
                    title: S.current.name,
                    data: userController.user.value.fullName,
                    onTap: () => Get.to(() => const NewNames()),
                  ),
                  MyProfileMenuTile(
                    title: S.current.userName,
                    data: userController.user.value.userName,
                    onTap: () => Get.to(() => const EditUserName()),
                  ),
                  ItemSeparator.halfVerticalSeparator(),
                  const Divider(),
                  ItemSeparator.verticalSeparator(),
                  MySectionHeading(
                      title: S.current.personalInformation,
                      showActionButton: false),
                  ItemSeparator.verticalSeparator(),
                  MyProfileMenuTile(
                    title: S.current.userId,
                    data: userController.user.value.id,
                    icon: Iconsax.copy,
                    onTap: () => userController
                        .copyToClipboard(userController.user.value.id),
                  ),
                  MyProfileMenuTile(
                    title: S.current.email,
                    data: userController.user.value.email,
                    icon: Iconsax.copy,
                    onTap: () => userController
                        .copyToClipboard(userController.user.value.email),
                  ),
                  MyProfileMenuTile(
                    title: S.current.phoneNumber,
                    data: userController.user.value.phoneNumber,
                    onTap: () => Get.to(() => const EditPhoneNumber()),
                  ),
                  MyProfileMenuTile(
                    title: S.current.gender,
                    data: "Male", 
                    onTap: () {},
                  ),
                  MyProfileMenuTile(
                    title: S.current.dateOfBirth,
                    data: "23 August 2003", 
                    onTap: () {},
                  ),
                  ItemSeparator.halfVerticalSeparator(),
                  const Divider(),
                  ItemSeparator.verticalSeparator(),
                  TextButton(
                      onPressed: () =>
                          userController.deleteAccountWarningPopup(),
                      child: Text(
                        S.current.deleteAccount,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: MyColors.error),
                      ))
                ]);
              },
            ),
          ),
        )));
  }
}
