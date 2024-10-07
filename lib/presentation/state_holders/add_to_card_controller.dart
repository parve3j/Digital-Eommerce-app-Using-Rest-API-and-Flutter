import 'package:ecom_project_using_rest_api/data/service/network_caller.dart';
import 'package:ecom_project_using_rest_api/data/utlity/urls.dart';
import 'package:get/get.dart';

class AddToCartControoler extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage=>_errorMessage;
  Future<bool> addToCart(String token, int productId, String color, String size, int quantity) async{
    bool isSuccess=false;
    _inProgress=true;
    update();
    Map<String, dynamic> inputParams={
      "product_id":productId,
      "color":color,
      "size":size,
      "qty":quantity
    };
    final response = await NetworkCaller().postRequest(
        Urls.addToCart,
        token: token,
        body: inputParams,
    );
    if(response.isSuccess){
      isSuccess=true;
    }else{
      _errorMessage= response.errorMessage;
    }
    _inProgress=false;
    update();
    return isSuccess;
  }

}