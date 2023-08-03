import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:food/app/my_app.dart';
import 'package:food/app/my_app_controller.dart';
import 'package:food/core/data/repositories/shared_prefreance_repository.dart';
import 'package:food/core/services/cart_service.dart';
import 'package:food/core/services/connectivity_service.dart';
import 'package:food/core/services/location_service.dart';
import 'package:food/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/notification_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

//qamar
  Get.put(SharedPrefranceRepository());

//!qamar hiiiiii
//qamat...
  Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(NotificationService());

  runApp(MyApp());
}
