import 'package:cab_tab/Routes/routes.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var name = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;

  var nameError = Rx<String?>(null);
  var phoneError = Rx<String?>(null);
  var passwordError = Rx<String?>(null);

  void register() {
    if (name.value.isEmpty) {
      nameError.value = 'Name cannot be empty';
    } else {
      nameError.value = null;
    }

    if (phone.value.isEmpty) {
      phoneError.value = 'Phone cannot be empty';
    } else if (phone.value.length != 10) {
      phoneError.value = 'Phone must be 10 digits';
    } else {
      phoneError.value = null;
    }

    if (password.value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = null;
    }

    if (nameError.value == null && phoneError.value == null && passwordError.value == null) {
      print('Registration successful');

      Get.toNamed(Routes.OTP_VERIFICATION);
    }
  }



  void toLoginPage(){
    Get.toNamed(Routes.lOGIN_PAGE);
  }
}
