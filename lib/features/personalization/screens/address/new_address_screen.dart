import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/myappbar.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/colors.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../controllers/addresses_controller.dart';

class NewAddressScreen extends StatelessWidget {
  const NewAddressScreen({super.key, this.isUpdate = false});
  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressesController());
    return Scaffold(
        appBar: MyAppBar(
          showBackButton: true,
          title: Text(
            isUpdate ? S.current.updateAddress : S.current.addNewAddress,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(MyDimensions.defultSpacing),
                child: Form(
                  key: addressController.newAddressFormKey,
                  child: Column(children: [
                    TextFormField(
                      controller: addressController.nameController,
                      validator: (value) =>
                          MyValidator.validateEmptyText(S.current.name, value),
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        labelText: S.current.name,
                        prefixIcon: const Icon(Iconsax.user),
                      ),
                    ),
                    ItemSeparator.verticalSeparator(),
                    TextFormField(
                      controller: addressController.phoneNumberController,
                      validator: (value) =>
                          MyValidator.validatePhoneNumber(value),
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        labelText: S.current.phoneNumber,
                        prefixIcon: const Icon(Iconsax.mobile),
                      ),
                    ),
                    ItemSeparator.verticalSeparator(),
                    TextFormField(
                      controller: addressController.buildingNumberController,
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        labelText: S.current.buildingNumber,
                        prefixIcon: const Icon(Iconsax.building_31),
                      ),
                    ),
                    ItemSeparator.verticalSeparator(),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: addressController.streetController,
                            validator: (value) =>
                                MyValidator.validateEmptyText(S.current.street, value),
                            cursorColor: MyColors.primaryColor,
                            decoration: InputDecoration(
                              labelText: S.current.street,
                              prefixIcon: const Icon(Iconsax.building_3),
                            ),
                          ),
                        ),
                        ItemSeparator.halfHorizontalSeparator(),
                        Expanded(
                          child: TextFormField(
                            controller: addressController.postalCodeController,
                            validator: (value) =>
                                MyValidator.validateEmptyText(S.current.postalCode, value),
                            cursorColor: MyColors.primaryColor,
                            decoration: InputDecoration(
                              labelText: S.current.postalCode,
                              prefixIcon: const Icon(Iconsax.code),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ItemSeparator.verticalSeparator(),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: addressController.cityController,
                            validator: (value) =>
                                MyValidator.validateEmptyText(S.current.city, value),
                            cursorColor: MyColors.primaryColor,
                            decoration: InputDecoration(
                              labelText: S.current.city,
                              prefixIcon: const Icon(Iconsax.building),
                            ),
                          ),
                        ),
                        ItemSeparator.halfHorizontalSeparator(),
                        Expanded(
                          child: TextFormField(
                            controller: addressController.stateController,
                            validator: (value) =>
                                MyValidator.validateEmptyText(S.current.state, value),
                            cursorColor: MyColors.primaryColor,
                            decoration: InputDecoration(
                              labelText: S.current.state,
                              prefixIcon: const Icon(Iconsax.location),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ItemSeparator.verticalSeparator(),
                    TextFormField(
                      controller: addressController.countryController,
                      validator: (value) =>
                          MyValidator.validateEmptyText(S.current.country, value),
                      cursorColor: MyColors.primaryColor,
                      decoration: InputDecoration(
                        labelText: S.current.country,
                        prefixIcon: const Icon(Iconsax.global),
                      ),
                    ),
                    const SizedBox(
                      height: MyDimensions.defultSpacing,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: isUpdate
                              ? () => addressController.updateAddress()
                              : () => addressController.addNewAddress(),
                          child: Text(isUpdate ? S.current.update : S.current.save)),
                    )
                  ]),
                ))));
  }
}
