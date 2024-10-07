import 'package:ecom_project_using_rest_api/data/service/network_caller.dart';
import 'package:ecom_project_using_rest_api/data/utlity/urls.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/read_profile_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;
  bool _shouldNavigateCompleteProfile= true;
  bool get shouldNavigateCompleteProfile=>_shouldNavigateCompleteProfile;
  String _token='';
  String get token=>_token;
  
  Future<bool> verifyOtp(String email, String otp) async{
    _inProgress= true;
    update();
    final response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress=false;
    if(response.isSuccess){
      _token= response.responseData['data'];
      final result = await Get.find<ReadProfileController>().readProfileData(token);
      if(result){
        _shouldNavigateCompleteProfile=Get.find<ReadProfileController>().isProfileCompleted==false;
        if(_shouldNavigateCompleteProfile==false){
          await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileController>().profile);
        }
      }else{
        _errorMessage=Get.find<ReadProfileController>().errorMessage;
        update();
        return false;
      }
      /// Save local cache
      update();
      return true;
    }else{
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}