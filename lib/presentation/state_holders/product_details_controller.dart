import 'package:ecom_project_using_rest_api/data/model/product_details.dart';
import 'package:ecom_project_using_rest_api/data/model/product_details_model.dart';
import 'package:ecom_project_using_rest_api/data/model/response_data.dart';
import 'package:ecom_project_using_rest_api/data/service/network_caller.dart';
import 'package:ecom_project_using_rest_api/data/utlity/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;

  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  String _errorMessage='';
  String get errorMessage=>_errorMessage;
  ProductDetails get productDetails=>_productDetailsModel.ProductDeailsList!.first;

  Future<bool> getProductDetails(int productID) async{
    bool isSuccess = false;
    _inProgress=true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.productDetails(productID));
    if(response.isSuccess){
      _productDetailsModel= ProductDetailsModel.fromJson(response.responseData);
      isSuccess=true;
    }else{
      _errorMessage=response.errorMessage;
    }
    _inProgress=false;
    update();
    return isSuccess;
  }

  int CalculatePrice( dynamic price, dynamic noItem){
    int parsedPrice = (price is String) ? int.parse(price) : price;
    int parsedNoItem = (noItem is String) ? int.parse(noItem) : noItem;
    int result = parsedPrice * parsedNoItem;
    return result;
  }

}