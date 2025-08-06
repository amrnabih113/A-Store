import 'package:a_store/features/shop/models/product_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/exceptions/exceptions.dart';
import 'package:a_store/utils/exceptions/format_exceptions.dart';
import 'package:a_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductsRepository extends GetxController {
  static ProductsRepository get instance => Get.find();

  final _db = Supabase.instance.client.from('products');

  Future<List<ProductModel>> fetchALLProducts() async {
    try {
      final response = await _db.select("*");
      if (response.isNotEmpty) {
        return response.map((e) => ProductModel.fromJson(e)).toList();
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

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _db.select("*").limit(20);
      if (response.isNotEmpty) {
        return response.map((e) => ProductModel.fromJson(e)).toList();
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

  Future<List<ProductModel>> fetchProductsByCategory(int categoryId,
      {int? limit}) async {
    try {
      final response = await _db
          .select("*")
          .eq("category_id", categoryId)
          .limit(limit ?? 20);
      if (response.isNotEmpty) {
        return response.map((e) => ProductModel.fromJson(e)).toList();
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

  Future<List<ProductModel>> fetchProductsByBrand(int brandId,
      {int? limit}) async {
    try {
      final response =
          await _db.select("*").eq("brand_id", brandId).limit(limit ?? 20);
      if (response.isNotEmpty) {
        return response.map((e) => ProductModel.fromJson(e)).toList();
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

  Future<List<ProductModel>> fetchFavouriteProducts(
      List<int> favourites) async {
    try {
      final List<ProductModel> favorites = [];
      for (var i = 0; i < favourites.length; i++) {
        final response = await _db.select("*").eq("id", favourites[i]);
        if (response.isNotEmpty) {
          response.map((e) => ProductModel.fromJson(e)).toList();
          favorites
              .addAll(response.map((e) => ProductModel.fromJson(e)).toList());
        }
      }
      return favorites;
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
