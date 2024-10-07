import 'package:ecom_project_using_rest_api/data/model/category_list_model.dart';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utlity/urls.dart';

class CategoryListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;
  CategoryListModel _categotyListModel = CategoryListModel();
  CategoryListModel get categoryListModel=>_categotyListModel;

  Future<bool> getCategoryList() async{
    bool isSuccess =  false;
    _inProgress= true;
    update();
    final response = await NetworkCaller().getRequest(Urls.categoryList);
    _inProgress=false;
    if(response.isSuccess){
      _categotyListModel= CategoryListModel.fromJson(response.responseData);
      isSuccess= true;
    }else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
