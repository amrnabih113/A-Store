import 'dart:io';

import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/features/authentication/models/user_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/exceptions/format_exceptions.dart';
import 'package:a_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final user = AuthenticationRepository.instance.currentUser;
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      final response = await _client
          .from("users")
          .select()
          .eq("firebase_id", user.id)
          .limit(1);
      if (response.isNotEmpty) {
      } else {
        await _client.from("users").upsert(user.toJson());
      }
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final response = await _client
          .from("users")
          .select()
          .eq("firebase_id", user!.uid)
          .limit(1)
          .single();
      if (response.isNotEmpty) {
        return UserModel.fromJson(response);
      } else {
        return UserModel.empty();
      }
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> deleteUserRecord(String userId) async {
    try {
      await _client.from("users").delete().eq("firebase_id", userId);
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _client.from("users").update(json).eq("firebase_id", user!.uid);
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw S.current.errorMessage;
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final response =
          await Supabase.instance.client.storage.from('avatars').list();
      final exists = response.any((file) {
        return file.name == path;
      });

      if (exists) {
        final publicUrl =
            Supabase.instance.client.storage.from('avatars').getPublicUrl(path);
        return publicUrl;
      } else {
        await Supabase.instance.client.storage
            .from('avatars')
            .upload(path, File(image.path));
        final publicUrl =
            Supabase.instance.client.storage.from('avatars').getPublicUrl(path);
        return publicUrl;
      }
    } on PostgrestException catch (e) {
      throw 'Error uploading image: ${e.message}';
    } on StorageException catch (e) {
      throw 'Storage error: ${e.message}';
    } catch (e) {
        throw S.current.errorMessage;
    }
  }
}
