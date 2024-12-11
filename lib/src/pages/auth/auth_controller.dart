import 'package:get/get.dart';
import 'package:green_io/src/pages/auth/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRepository();

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;

    await authRepository.signIn(email, password);

    isLoading.value = false;
  }
}
