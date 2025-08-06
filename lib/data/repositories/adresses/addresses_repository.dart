import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/personalization/models/address_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/exceptions/exceptions.dart';
import 'package:a_store/utils/exceptions/format_exceptions.dart';
import 'package:a_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdressesRepository extends GetxController {
  static AdressesRepository get instance => Get.find();

  final _db = Supabase.instance.client.from('addresses');
  final userRepository = Get.put(UserRepository());

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      if (userRepository.user == null) {
        throw "User is not logged in";
      }
      final response =
          await _db.select().eq("user_id", userRepository.user!.uid);
      if (response.isNotEmpty) {
        return response.map((e) => AddressModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on Exception catch (e) {
      throw MyExceptions(e.toString()).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> addNewAddress(AddressModel address) async {
    try {
      await _db.insert(address.toJson());
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on Exception catch (e) {
      throw MyExceptions(e.toString()).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> updateSelectedAddress(
      AddressModel address, bool isSelected) async {
    try {
      await _db
          .update({"is_selected": isSelected})
          .eq("user_id", userRepository.user!.uid)
          .eq("id", address.id);
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on Exception catch (e) {
      throw MyExceptions(e.toString()).message;
    }catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> deleteAddress(AddressModel address) async {
    try {
      await _db
          .delete()
          .eq("user_id", userRepository.user!.uid)
          .eq("id", address.id);
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on Exception catch (e) {
      throw MyExceptions(e.toString()).message;
    }catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> updateAddress(AddressModel address) async {
    try {
      await _db
          .update(address.toJson())
          .eq("user_id", userRepository.user!.uid)
          .eq("id", address.id);
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on Exception catch (e) {
      throw MyExceptions(e.toString()).message;
    }catch (e) {
      throw S.current.errorMessage;
    }
  }
}
