import 'package:get/get.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/features/login/binding/login_binding.dart';
import 'package:wad_wad/features/login/view/login_screen.dart';
import 'package:wad_wad/features/onboard/binding/onboard_binding.dart';
import 'package:wad_wad/features/onboard/view/onboard_screen.dart';
import 'package:wad_wad/features/sign_up/binding/sign_up_binding.dart';
import 'package:wad_wad/features/sign_up/view/signup_screen.dart';

class AppRoutes {

  static const INITIAL = AppPages.ONBOARD;

  static final routes = [
    GetPage(
        name: AppPages.ONBOARD,
        page: () => const OnboardScreen(),
      binding: OnboardBinding()
    ),
    GetPage(
        name: AppPages.LOGIN,
        page: () => const LoginScreen(),
      binding: LoginBinding()
    ),
    GetPage(
        name: AppPages.SIGNUP,
        page: () => SignUpScreen(),
      binding: SignupBinding()
    )
  ];

}