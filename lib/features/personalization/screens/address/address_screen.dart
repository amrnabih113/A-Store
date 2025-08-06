import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/features/personalization/controllers/addresses_controller.dart';
import 'package:a_store/features/personalization/controllers/settings_controller.dart';
import 'package:a_store/features/personalization/models/address_model.dart';
import 'package:a_store/features/personalization/screens/address/new_address_screen.dart';
import 'package:a_store/features/personalization/widgets/address/address_card.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressesController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const NewAddressScreen()),
        backgroundColor: MyColors.primaryColor,
        child: const Icon(
          Iconsax.add,
          color: MyColors.white,
        ),
      ),
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(
          S.current.myAddresses,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MyDimensions.defultSpacing),
          child: Obx(
            () => FutureBuilder<List<AddressModel>>(
              future: addressController.fetchUserAddresses(),
              key: Key(addressController.refrechData.value.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('${S.current.error}: ${snapshot.error}'),
                  );
                }
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      S.current.noAddressFound,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final address = snapshot.data![index];
                    return Dismissible(
                      key: Key(address.id.toString()),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          addressController.editAddress(address);
                        } else if (direction == DismissDirection.endToStart) {
                          // Delete action
                          addressController.deleteAddress(address);
                        }
                      },
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: SettingsController.instance.isArabic()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: MyDimensions.defultSpacing),
                        child: const Icon(
                          Iconsax.edit,
                          color: MyColors.white,
                        ),
                      ),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: SettingsController.instance.isArabic()
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                            horizontal: MyDimensions.defultSpacing),
                        child: const Icon(
                          Iconsax.trash,
                          color: MyColors.white,
                        ),
                      ),
                      direction: DismissDirection.horizontal,
                      child: AddressCard(
                        address: address,
                        onTap: () => addressController.selectAddress(address),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
