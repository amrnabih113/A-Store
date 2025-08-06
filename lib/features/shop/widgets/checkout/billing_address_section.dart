import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/features/personalization/controllers/addresses_controller.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressesController());

    return Obx(() {
      final selectedAddress = addressController.selectedAddress.value;
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MySectionHeading(
          title: S.current.shippingAddress,
          showActionButton: true,
          buttontext: S.current.change,
          onPressed: () => addressController.selectAddressPopUp(context),),
        ItemSeparator.halfVerticalSeparator(),
        selectedAddress.name.isEmpty
            ?  Center(child: Text(S.current.selectAddress))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(

                    selectedAddress.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  ItemSeparator.halfVerticalSeparator(),
                  Row(children: [
                    const Icon(
                      Icons.phone,
                      color: MyColors.grey,
                      size: MyDimensions.iconMd,
                    ),
                    ItemSeparator.horizontalSeparator(),
                    Text(
                      selectedAddress.formattedphoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ]),
                  ItemSeparator.halfVerticalSeparator(),
                  Row(children: [
                    const Icon(
                      Iconsax.location5,
                      color: MyColors.grey,
                      size: MyDimensions.iconMd,
                    ),
                    ItemSeparator.horizontalSeparator(),
                    Flexible(
                      child: Text(
                        selectedAddress.fullAddress,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ]),
                ],
              ),
        ItemSeparator.halfVerticalSeparator(),
      ]);
    });
  }
}
