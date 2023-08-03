import 'package:food/core/data/repositories/shared_prefreance_repository.dart';
import 'package:food/ui/shared/utils.dart';
import 'package:food/ui/views/intro_view/intro_view.dart';
import 'package:food/ui/views/landing_view/landing_view.dart';
import 'package:food/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(IntroView());
      } else {
        Get.off(storage.getLoggedIN() ? LandingView() : LandingView());
      }
      //Get.back();
      storage.setFirstLunch(false);
    });
    super.onInit();
  }
}
