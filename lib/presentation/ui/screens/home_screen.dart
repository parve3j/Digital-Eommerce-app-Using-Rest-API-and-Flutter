import 'package:ecom_project_using_rest_api/data/model/products.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/home_banner_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/main_button_nav_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/popular_product_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/product_list.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/utlity/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/categpry_list_controller.dart';
import '../../state_holders/new_product_controller.dart';
import '../../state_holders/special_product_controller.dart';
import '../widgets/category_items.dart';
import '../widgets/home/circle_icon_button.dart';
import '../widgets/home/banner_caurosel.dart';
import '../widgets/home/section_title.dart';
import '../widgets/product_card_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              buildsSearchFiels,
              const SizedBox(height: 16),
              SizedBox(
                height: 210,
                child: GetBuilder<HomeBannerController>(
                    builder: (controller) => Visibility(
                          visible: controller.inProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: BannerCauroselWidget(
                            bannerList:
                                controller.bannerListModel.bannerList ?? [],
                          ),
                        )),
              ),
              const SizedBox(height: 16),
              SectionTitle(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              const SizedBox(height: 16),
              SectionTitle(
                title: 'Popular Product',
                onTap: () {
                  Get.to(() => const ProductList());
                },
              ),
              GetBuilder<PopularProductListController>(
                builder: (controller)=>
                Visibility(
                  visible: controller.inProgress==false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: productList(controller.productListModel.productList??[]),
                )
              ),
              const SizedBox(height: 16),
              SectionTitle(
                title: 'Special Product',
                onTap: () {},
              ),
              GetBuilder<SpecialProductListController>(
                  builder: (controller)=>
                      Visibility(
                        visible: controller.inProgress==false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: productList(controller.productListModel.productList??[]),
                      )
              ),
              const SizedBox(height: 16),
              SectionTitle(
                title: 'New Product',
                onTap: () {},
              ),
              GetBuilder<NewProductListController>(
                  builder: (controller)=>
                      Visibility(
                        visible: controller.inProgress==false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: productList(controller.productListModel.productList??[]),
                      )
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: GetBuilder<CategoryListController>(
          builder: (controller) => Visibility(
                visible: controller.inProgress == false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount:
                        controller.categoryListModel.categoryList?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryItems(
                        categories:
                            controller.categoryListModel.categoryList![index]),
                    separatorBuilder: (_, __) => const SizedBox(width: 8)),
              )),
    );
  }

  SizedBox productList(List<Products> productList) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ProductCardItems(
                products: productList[index],
              ),
          separatorBuilder: (_, __) => const SizedBox(width: 8)),
    );
  }

  // SizedBox get popularProductList {
  //   return SizedBox(
  //     height: 210,
  //     child: GetBuilder<PopularProductListController>(
  //       builder: (controller)=>
  //       Visibility(
  //         visible: controller.inProgress==false,
  //           replacement: const Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //           child: ListView.separated(
  //           primary: false,
  //           shrinkWrap: true,
  //           itemCount: controller.productListModel.productList?.length ??0,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) => ProductCardItems(
  //             products: controller.productListModel.productList![index],
  //           ),
  //           separatorBuilder: (_, __) => const SizedBox(width: 8)))
  //     ),
  //   );
  // }
  // SizedBox get specialProductList {
  //   return SizedBox(
  //     height: 210,
  //     child: GetBuilder<SpecialProductListController>(
  //       builder: (controller)=>
  //       Visibility(
  //         visible: controller.inProgress==false,
  //           replacement: const Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //           child: ListView.separated(
  //           primary: false,
  //           shrinkWrap: true,
  //           itemCount: controller.productListModel.productList?.length ??0,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) => ProductCardItems(
  //             products: controller.productListModel.productList![index],
  //           ),
  //           separatorBuilder: (_, __) => const SizedBox(width: 8)))
  //     ),
  //   );
  // }
  // SizedBox get newProductList {
  //   return SizedBox(
  //     height: 210,
  //     child: GetBuilder<NewProductListController>(
  //       builder: (controller)=>
  //       Visibility(
  //         visible: controller.inProgress==false,
  //           replacement: const Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //           child: ListView.separated(
  //           primary: false,
  //           shrinkWrap: true,
  //           itemCount: controller.productListModel.productList?.length ??0,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) => ProductCardItems(
  //             products: controller.productListModel.productList![index],
  //           ),
  //           separatorBuilder: (_, __) => const SizedBox(width: 8)))
  //     ),
  //   );
  // }

  TextFormField get buildsSearchFiels {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar => AppBar(
        title: Image.asset(AssetPath.logoNav),
        automaticallyImplyLeading: false,
        actions: [
          CircleIconButton(
            onTap: () {
              Get.find<AuthController>().clearAuthData();
              Get.offAll(() => const VerifyEmailScreen());
            },
            iconData: Icons.person_2_outlined,
          ),
          const SizedBox(width: 8),
          CircleIconButton(
            onTap: () {
              Get.find<AuthController>().clearAuthData();
            },
            iconData: Icons.call_outlined,
          ),
          const SizedBox(width: 8),
          CircleIconButton(
            onTap: () {
              Get.find<AuthController>().clearAuthData();
            },
            iconData: Icons.notifications_active_outlined,
          ),
          const SizedBox(width: 12),
        ],
      );
}
