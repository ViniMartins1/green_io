import 'package:get/get.dart';
import 'package:green_io/src/pages/auth/login_page.dart';
import 'package:green_io/src/pages/auth/register_page.dart';
import 'package:green_io/src/pages/base/base_page.dart';
import 'package:green_io/src/pages/splash/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PageRoutes.splashRoute, page: () => const SplashPage()),
    GetPage(name: PageRoutes.loginRoute, page: () => LoginPage()),
    GetPage(name: PageRoutes.registerRoute, page: () => const RegisterPage()),
    GetPage(name: PageRoutes.baseRoute, page: () => const BasePage()),
  ];
}

abstract class PageRoutes {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String baseRoute = '/';
}
