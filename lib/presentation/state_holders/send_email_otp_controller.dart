import 'package:ecom_project_using_rest_api/data/model/response_data.dart';
import 'package:ecom_project_using_rest_api/data/service/network_caller.dart';
import 'package:ecom_project_using_rest_api/data/utlity/urls.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController{
  bool _inProgress= false;
  bool get inProgress=> _inProgress;
  String _errorMessage='';
  String get errorMessage=>_errorMessage;

  Future<bool> sendOtpEmail(String email) async{
    _inProgress= true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.sendEmailOtp(email));
    _inProgress=false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      _errorMessage= response.errorMessage;
      update();
      return false;
    }
  }
}