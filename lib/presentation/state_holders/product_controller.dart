import 'package:ecom_project_using_rest_api/data/model/product_list_model.dart';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utlity/urls.dart';

class ProductController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;
  ProductListModel _productListModel = ProductListModel();
  ProductListModel get productListModel=>_productListModel;

  Future<bool> getProductList({required int catID}) async{
    bool isSuccess =  false;
    _inProgress= true;
    update();
    final response = await NetworkCaller().getRequest(Urls.productByCategory(catID));
    _inProgress=false;
    if(response.isSuccess){
      _productListModel= ProductListModel.fromJson(response.responseData);
      isSuccess= true;
    }else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
