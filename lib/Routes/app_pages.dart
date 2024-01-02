import 'package:cab_tab/Routes/routes.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/cab.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/car_repairing.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/drivers.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/fuel.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/hospitals.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/hotels.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/puncture.dart';
import 'package:cab_tab/Screens/Grid_Tab_Screens/towing.dart';
import 'package:cab_tab/Screens/homeScreen.dart';
import 'package:cab_tab/Screens/login_page.dart';
import 'package:cab_tab/Screens/otp_verification.dart';
import 'package:cab_tab/Screens/registeration_page.dart';
import 'package:cab_tab/Screens/splash_screen.dart';
import 'package:get/get.dart';
import '../Screens/Grid_Tab_Screens/restuarants.dart';

class AppPages {
  static const INITIAL_ROUTE = Routes.REGISTRATION_PAGE;

  static final routes = [
    GetPage(name: Routes.SPLASH_SCREEN, page: () => SplashScreen()),
    GetPage(name: Routes.REGISTRATION_PAGE, page: () => RegistrationsPage()),
    GetPage(name: Routes.OTP_VERIFICATION, page: () => VerifyOtp()),
    GetPage(name: Routes.lOGIN_PAGE, page: () => LoginPage()),
    GetPage(name: Routes.HOME_PAGE, page: () => HomePage()),
    GetPage(name: Routes.CAB_PAGE, page: () => CabTab()),
    GetPage(name: Routes.CAR_REPAIRING_PAGE, page: () => CarRepairing()),
    GetPage(name: Routes.DRIVER_PAGE, page: () => Drivers()),
    GetPage(name: Routes.FUEL_PAGE, page: () => Fuel()),
    GetPage(name: Routes.HOSPITAlS_PAGE, page: () => Hospitals()),
    GetPage(name: Routes.HOTELS_PAGE, page: () => Hotels()),
    GetPage(name: Routes.PUNCTURE_PAGE, page: () => Puncture()),
    GetPage(name: Routes.RESTURANTS_PAGE, page: () => Resturants()),
    GetPage(name: Routes.TOWING_PAGE, page: () => Towing()),
  ];
}
