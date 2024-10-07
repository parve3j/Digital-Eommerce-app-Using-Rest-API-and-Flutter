import 'package:ecom_project_using_rest_api/presentation/state_holders/add_to_card_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/cart_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/cart_delete_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/categpry_list_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/complete_profile_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/home_banner_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/main_button_nav_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/new_product_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/popular_product_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/product_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/product_details_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/read_profile_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/special_product_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/vefify_otp_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/send_email_otp_controller.dart';

class ControllerBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
    Get.put(CreateProfileController());
    Get.put(HomeBannerController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartControoler());
    Get.put(CartListController());
    Get.put(CartDeleteController());
  }

}
