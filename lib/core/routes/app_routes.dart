import 'package:get/get.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/features/add_dog_profile/binding/add_dog_profile_binding.dart';
import 'package:wad_wad/features/add_dog_profile/view/add_dog_profile_screen.dart';
import 'package:wad_wad/features/forgot_password/binding/forgot_password_binding.dart';
import 'package:wad_wad/features/forgot_password/view/forgot_password_screen.dart';
import 'package:wad_wad/features/home/binding/home_binding.dart';
import 'package:wad_wad/features/home/view/home_screen.dart';
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
        page: () => LoginScreen(),
      binding: LoginBinding()
    ),
    GetPage(
        name: AppPages.SIGNUP,
        page: () => SignUpScreen(),
      binding: SignupBinding()
    ),
    GetPage(
        name: AppPages.HOME,
        page: ()=> HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
        name: AppPages.ADDDOGPROFILE,
        page: ()=> const AddDogProfileScreen(),
      binding: AddDogProfileBinding()
    ),
    GetPage(
        name: AppPages.FORGOTPASSWORD,
        page: ()=> ForgotPasswordScreen(),
      binding: ForgotPasswordBinding()
    )
  ];

}