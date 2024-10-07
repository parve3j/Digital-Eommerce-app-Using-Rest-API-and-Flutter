import 'package:ecom_project_using_rest_api/data/model/create_profile_params.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/model/profile.dart';
import '../../data/service/network_caller.dart';
import '../../data/utlity/urls.dart';

class CreateProfileController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;
  Profile _profile = Profile();
  Profile get profile=>_profile;

  Future<bool> createProfileData(String token, CreateProfileParams params) async{
    _inProgress= true;
    update();
    final response = await NetworkCaller().postRequest(Urls.createProfile, token: token,body: params.toJson());
    _inProgress=false;
    if(response.isSuccess){
      _profile= Profile.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    }else{
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
