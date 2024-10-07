import 'package:ecom_project_using_rest_api/data/model/profile.dart';
import 'package:get/get.dart';

import '../../data/service/network_caller.dart';
import '../../data/utlity/urls.dart';

class ReadProfileController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;
  Profile _profile = Profile();
  Profile get profile=>_profile;
  bool _isProfileCompleted=false;
  bool get isProfileCompleted=>_isProfileCompleted;

  Future<bool> readProfileData(String token) async{
    _inProgress= true;
    update();
    final response = await NetworkCaller().getRequest(Urls.readProfile, token: token);
    _inProgress=false;
    if(response.isSuccess){
      final pfofileData= response.responseData['data'];
      if(pfofileData==null){
       _isProfileCompleted=false;
      }else{
        _isProfileCompleted=true;
        _profile= Profile.fromJson(pfofileData);
      }
      update();
      return true;
    }else{
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
