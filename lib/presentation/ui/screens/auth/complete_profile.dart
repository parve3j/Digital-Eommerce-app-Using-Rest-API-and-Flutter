import 'package:ecom_project_using_rest_api/presentation/state_holders/vefify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/create_profile_params.dart';
import '../../../state_holders/complete_profile_controller.dart';
import '../../widgets/app_logo.dart';
import '../main_bottom_nav_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _customerAddress = TextEditingController();
  final TextEditingController _customerCity = TextEditingController();
  final TextEditingController _customerState = TextEditingController();
  final TextEditingController _customerPostcode = TextEditingController();
  final TextEditingController _customerContry = TextEditingController();
  final TextEditingController _customerPhone = TextEditingController();
  final TextEditingController _customerFax = TextEditingController();
  final TextEditingController _shippintName = TextEditingController();
  final TextEditingController _shippingAddress = TextEditingController();
  final TextEditingController _shippingCity = TextEditingController();
  final TextEditingController _shippingState = TextEditingController();
  final TextEditingController _shippingPostcode = TextEditingController();
  final TextEditingController _shippingCountry = TextEditingController();
  final TextEditingController _shippingPhone = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _customerName.dispose();
    _customerAddress.dispose();
    _customerCity.dispose();
    _customerState.dispose();
    _customerPostcode.dispose();
    _customerContry.dispose();
    _customerPhone.dispose();
    _customerFax.dispose();
    _shippintName.dispose();
    _shippingAddress.dispose();
    _shippingCity.dispose();
    _shippingState.dispose();
    _shippingPostcode.dispose();
    _shippingCountry.dispose();
    _shippingPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(children: [
              const SizedBox(height: 48),
              const AppLogo(height: 80),
              const SizedBox(height: 24),
              Text(
                'Complete Profile',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 4),
              Text(
                'Get started with us with your details',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerName,
                decoration: const InputDecoration(hintText: 'Customer Name'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Customer Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerAddress,
                decoration: const InputDecoration(hintText: 'Address'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter your Address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerCity,
                decoration: const InputDecoration(hintText: 'Customer City'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter your city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerState,
                decoration: const InputDecoration(hintText: 'Customr State'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter your State Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerPostcode,
                decoration: const InputDecoration(
                    hintText: 'Customer Post Code'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter your Post Code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerContry,
                decoration: const InputDecoration(hintText: 'Customer Country'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter your Country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerPhone,
                decoration: const InputDecoration(hintText: 'Customer Phone'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter your Phone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _customerFax,
                decoration: const InputDecoration(hintText: 'Customer Fax'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter your Fax';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _shippintName,
                decoration: const InputDecoration(hintText: 'Shipping Name'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Shipping Name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _shippingAddress,
                decoration: const InputDecoration(hintText: 'Shipping address'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Shipping address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _shippingCity,
                decoration: const InputDecoration(hintText: 'Shipping City'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Shipping City';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _shippingState,
                decoration: const InputDecoration(hintText: 'Shipping State'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Shipping State';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _shippingPostcode,
                decoration: const InputDecoration(
                    hintText: 'Shipping Post code'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Shipping Post Code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _shippingCountry,
                decoration: const InputDecoration(hintText: 'Shipping Country'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Shipping Country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _shippingPhone,
                decoration: const InputDecoration(hintText: 'Shipping Phone'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value
                      ?.trim()
                      .isEmpty ?? true) {
                    return 'Enter Shipping Phone';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<CreateProfileController>(
                  builder: (controller) =>
                      Visibility(
                        visible: controller.inProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final createProfileParam = CreateProfileParams(
                                customerName: _customerName.text.trim(),
                                customerAddress: _customerAddress.text.trim(),
                                customerCity: _customerCity.text.trim(),
                                customerState: _customerState.text.trim(),
                                customerPostcode: _customerPostcode.text.trim(),
                                customerContry: _customerContry.text.trim(),
                                customerPhone: _customerPhone.text.trim(),
                                customerFax: _customerFax.text.trim(),
                                shippintName: _shippintName.text.trim(),
                                shippingAddress: _shippingAddress.text.trim(),
                                shippingCity: _shippingCity.text.trim(),
                                shippingState: _shippingState.text.trim(),
                                shippingPostcode: _shippingPostcode.text.trim(),
                                shippingCountry: _shippingCountry.text.trim(),
                                shippingPhone: _shippingPhone.text.trim(),
                              );
                              final bool result =
                              await controller.createProfileData(
                                Get
                                    .find<VerifyOtpController>()
                                    .token,
                                createProfileParam,
                              );
                              if (result) {
                                Get.offAll(() => const MainBottomNavScreen());
                              } else {
                                Get.snackbar(
                                  'Something Went Wrong',
                                  controller.errorMessage,
                                );
                              }
                            }
                          },
                          child: const Text('Complete'),
                        ),
                      ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
