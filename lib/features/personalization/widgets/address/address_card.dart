import 'package:a_store/common/shapes/my_rounded_container.dart';
import 'package:a_store/features/personalization/controllers/addresses_controller.dart';
import 'package:a_store/features/personalization/models/address_model.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final controller = AddressesController.instance;
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAdress = selectedAddressId == address.id;
      return Directionality(
        textDirection: TextDirection.ltr,
        child: InkWell(
          onTap: onTap,
          child: MyRoundedContainer(
            radius: 20,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: MyDimensions.xs),
            padding: const EdgeInsets.all(MyDimensions.md),
            backgroundColor: selectedAdress
                ? MyColors.primaryColor.withOpacity(0.4)
                : Colors.transparent,
            showBorder: !selectedAdress,
            borderColor: isDark ? MyColors.darkGrey : MyColors.grey,
            child: Stack(children: [
              Positioned(
                top: 0,
                right: 5,
                child: Icon(
                  selectedAdress ? Iconsax.tick_circle5 : null,
                  color: isDark
                      ? MyColors.primaryColor.withOpacity(0.8)
                      : MyColors.black.withOpacity(0.8),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: MyDimensions.xs),
                  Text(
                    address.formattedphoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: MyDimensions.xs),
                  Text(
                    address.fullAddress,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ]),
          ),
        ),
      );
    });
  }
}
