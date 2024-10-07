import 'package:ecom_project_using_rest_api/presentation/ui/screens/auth/complete_profile.dart';
import 'package:ecom_project_using_rest_api/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../state_holders/vefify_otp_controller.dart';
import '../../widgets/app_logo.dart';
class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController= TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 160),
                const AppLogo(height: 80),
                const SizedBox(height: 24),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  controller: _otpController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: Colors.teal,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.greenAccent),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(height: 24),
                GetBuilder<VerifyOtpController>(
                  builder: (controller)=>
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress==false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            bool response= await controller.verifyOtp(widget.email, _otpController.text);
                            if(response){
                              Get.snackbar(
                                "Success",
                                "OTP Works successfully",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.teal,
                                colorText: Colors.white,
                              );
                              if(controller.shouldNavigateCompleteProfile){
                                Get.to(()=> const CompleteProfileScreen());
                              }else{
                                Get.to(()=>MainBottomNavScreen());
                              }
                            }else{
                              Get.snackbar(
                                controller.errorMessage,
                                "Failed to send OTP. Please try again.",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.redAccent,
                                colorText: Colors.white,
                              );
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
