import 'package:green_io/src/constants/endpoints.dart';
import 'package:green_io/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<void> signIn(String email, String password) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.login,
      method: HttpMethod.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      print('tudo ok');
    } else {
      print('nada ok');
    }
  }
}
