import 'package:cab_tab/Routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxInt selectedIndex = 0.obs;



  void navigateToTab(int index) {
    selectedIndex.value = index;


    switch (index) {
      case 0:
       Get.toNamed(Routes.CAB_PAGE);
        break;
      case 1:
        Get.toNamed(Routes.HOTELS_PAGE);
        break;
      case 2:
        Get.toNamed(Routes.RESTURANTS_PAGE);
        break;
      case 3:
        Get.toNamed(Routes.CAR_REPAIRING_PAGE);
        break;
      case 4:
        Get.toNamed(Routes.TOWING_PAGE);
        break;
      case 5:
        Get.toNamed(Routes.FUEL_PAGE);
        break;
      case 6:
        Get.toNamed(Routes.PUNCTURE_PAGE);
        break;
      case 7:
        Get.toNamed(Routes.DRIVER_PAGE);
        break;
      case 8:
        Get.toNamed(Routes.HOSPITAlS_PAGE);
        break;
    }
  }


}
