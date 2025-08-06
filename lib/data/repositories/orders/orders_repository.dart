import 'package:a_store/data/repositories/user/user_repository.dart';
import 'package:a_store/features/shop/models/order_model.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/exceptions/exceptions.dart';
import 'package:a_store/utils/exceptions/format_exceptions.dart';
import 'package:a_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrdersRepository extends GetxController {
  static OrdersRepository get instance => Get.find();
  final _db = Supabase.instance.client.from('orders');
  
  final  userId = UserRepository.instance.user!.uid;
  
  
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final response = await _db.select().eq('user_id', userId);
      if (response.isNotEmpty) {
        return response.map((e) => OrderModel.fromJson(e)).toList();
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

  Future<void> addNewOrder(OrderModel order) async {
    try {
      await _db.insert(order.toJson());
    } on FormatException catch (_) {
      throw const MyFormatException().message;
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } on Exception catch (e) {
      throw MyExceptions(e.toString()).message;
    } catch (e) {
      throw S.current.errorMessage;}
  }
  
}
