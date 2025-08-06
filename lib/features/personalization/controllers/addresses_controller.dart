import 'package:a_store/common/styles/itemseparator.dart';
import 'package:a_store/common/widgets/mysection_heading.dart';
import 'package:a_store/data/repositories/adresses/addresses_repository.dart';
import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/personalization/models/address_model.dart';
import 'package:a_store/features/personalization/screens/address/new_address_screen.dart';
import 'package:a_store/features/personalization/widgets/address/address_card.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/dimintions.dart';
import 'package:a_store/utils/constants/images.dart';
import 'package:a_store/utils/helpers/network_manager.dart';
import 'package:a_store/utils/popups/full_screen_loader.dart';
import 'package:a_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddressesController extends GetxController {
  static AddressesController get instance => Get.find();

  @override
  void onInit() {
    fetchUserAddresses();
    super.onInit();
  }

  final AdressesRepository repository = Get.put(AdressesRepository());
  final UserRepository userRepository = UserRepository.instance;
  final RxBool openTopMenu = false.obs;

  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final isLoading = false.obs;

  final refrechData = false.obs;

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final buildingNumberController = TextEditingController();
  final streetController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();

  final newAddressFormKey = GlobalKey<FormState>();

  final updateddAddressId = "".obs;

  void clearForm() {
    super.onInit();
    nameController.clear();
    phoneNumberController.clear();
    buildingNumberController.clear();
    streetController.clear();
    postalCodeController.clear();
    cityController.clear();
    stateController.clear();
    countryController.clear();
  }

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      isLoading.value = true;
      final addresses = await repository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (address) => address.isSelected == true,
          orElse: () => AddressModel.empty());
      isLoading.value = false;
      return addresses;
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      isLoading.value = false;
      return [];
    }
  }

  Future<void> addNewAddress() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      if (!newAddressFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      final AddressModel newAddress = AddressModel(
        id: const Uuid().v4(),
        userId: userRepository.user!.uid,
        name: nameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        buildingNumber: buildingNumberController.text.trim(),
        street: streetController.text.trim(),
        postalCode: postalCodeController.text.trim(),
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        country: countryController.text.trim(),
        isSelected: true,
      );
      await repository.addNewAddress(newAddress);
      selectAddress(newAddress);
      clearForm();
      refrechData.toggle();
      MyFullScreenLoader.stopLoading();
      Get.back();
      MyLoaders.successSnackBar(
          title: S.current.success, message: S.current.addressAdded);
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      MyFullScreenLoader.stopLoading();
    }
  }

  Future<void> selectAddress(AddressModel address) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await repository.updateSelectedAddress(selectedAddress.value, false);
      }
      address.isSelected = true;
      selectedAddress.value = address;
      await repository.updateSelectedAddress(address, true);
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      isLoading.value = false;
    }
  }

  Future<void> optionMenu(AddressModel address) async {
    try {
      await selectAddress(address);
      openTopMenu.value = !openTopMenu.value;
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      isLoading.value = false;
    }
  }

  Future<void> deleteAddress(AddressModel address) async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      await repository.deleteAddress(address);
      refrechData.toggle();
      MyFullScreenLoader.stopLoading();
      MyLoaders.successSnackBar(
          title: S.current.success, message: S.current.addressDeleted);
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      MyFullScreenLoader.stopLoading();
    }
  }

  void editAddress(AddressModel address) {
    updateddAddressId.value = address.id;
    nameController.text = address.name;
    phoneNumberController.text = address.phoneNumber;
    buildingNumberController.text = address.buildingNumber!;
    streetController.text = address.street;
    postalCodeController.text = address.postalCode;
    cityController.text = address.city;
    stateController.text = address.state;
    countryController.text = address.country;
    Get.to(() => const NewAddressScreen(
          isUpdate: true,
        ));
  }

  Future<void> updateAddress() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          S.current.requestProcessing, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      if (!newAddressFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }
      final updatedAddress = AddressModel(
        id: updateddAddressId.value,
        userId: selectedAddress.value.userId,
        name: nameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        buildingNumber: buildingNumberController.text.trim(),
        street: streetController.text.trim(),
        postalCode: postalCodeController.text.trim(),
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        country: countryController.text.trim(),
        isSelected: selectedAddress.value.isSelected,
      );
      await repository.updateAddress(updatedAddress);
      refrechData.toggle();
      MyFullScreenLoader.stopLoading();
      Get.back();
      MyLoaders.successSnackBar(
          title: S.current.success, message: S.current.addressUpdated);
    } catch (e) {
      MyLoaders.errorSnackBar(title: S.current.ohSnap, message: e.toString());
      MyFullScreenLoader.stopLoading();
    }
  }

  Future<dynamic> selectAddressPopUp(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(MyDimensions.lg),
                child: Column(
                  children: [
                    MySectionHeading(
                      title: S.current.selectAddress,
                      showActionButton: false,
                    ),
                    ItemSeparator.verticalSeparator(),
                    FutureBuilder(
                        future: fetchUserAddresses(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          }
                          if (snapshot.data!.isEmpty) {
                            return Center(
                                child: Text(S.current.noAddressFound));
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final address = snapshot.data![index];
                              return AddressCard(
                                address: snapshot.data![index],
                                onTap: () async {
                                  await selectAddress(address)
                                      .then((value) => Get.back());
                                },
                              );
                            },
                          );
                        }),
                    ItemSeparator.verticalSeparator(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const NewAddressScreen()),
                          child: Text(S.current.addNewAddress)),
                    )
                  ],
                ),
              ),
            ));
  }
}
