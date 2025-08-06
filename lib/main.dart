import 'package:a_store/app.dart';
import 'package:a_store/data/repositories/authentication/auth_repository.dart';
import 'package:a_store/firebase_options.dart';
import 'package:a_store/generated/l10n.dart';
import 'package:a_store/utils/constants/supabase_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  S.load(const Locale('en'));
  // add widget binding
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Todo: init local storage
  await GetStorage.init();
  //Todo: Await Native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  //Todo: init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  await Supabase.initialize(
    url: SupabaseConstants.url,
    anonKey: SupabaseConstants.anonKey,
  );
  //Todo: init Auth

  runApp(const MyApp());
}

class Git {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}
