import 'package:ecom_project_using_rest_api/data/model/banner_list_model.dart';
import 'package:ecom_project_using_rest_api/data/model/create_profile_params.dart';
import 'package:ecom_project_using_rest_api/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/model/profile.dart';
import '../../data/service/network_caller.dart';
import '../../data/utlity/urls.dart';

class HomeBannerController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;
  BannerListModel _bannerListModel = BannerListModel();
  BannerListModel get bannerListModel=>_bannerListModel;

  Future<bool> getBannerList() async{
    bool isSuccess =  false;
    _inProgress= true;
    update();
    final response = await NetworkCaller().getRequest(Urls.homeBanner);
    _inProgress=false;
    if(response.isSuccess){
      _bannerListModel= BannerListModel.fromJson(response.responseData);
      isSuccess= true;
    }else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
