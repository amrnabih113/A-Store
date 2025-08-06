import 'package:a_store/features/shop/models/banner_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/exceptions/exceptions.dart';
import 'package:a_store/utils/exceptions/format_exceptions.dart';
import 'package:a_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BannersRepository extends GetxController {
  static BannersRepository get instance => Get.find();

  final _db = Supabase.instance.client.from('banners');

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final response = await _db.select();
      if (response.isNotEmpty) {
        return response.map((e) => BannerModel.fromJson(e)).toList();
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
}
