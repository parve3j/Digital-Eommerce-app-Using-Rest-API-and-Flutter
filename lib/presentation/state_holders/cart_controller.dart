import 'package:ecom_project_using_rest_api/data/model/product_list_model.dart';
import 'package:get/get.dart';
import '../../data/model/cart_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/utlity/urls.dart';

class CartListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;
  CardModel _cartModel = CardModel();
  CardModel get cartModel=>_cartModel;

  Future<bool> getAllCart(String token) async{
    bool isSuccess =  false;
    _inProgress= true;
    update();
    final response = await NetworkCaller().getRequest(Urls.cartList, token: token);
    _inProgress=false;
    if(response.isSuccess){
      _cartModel= CardModel.fromJson(response.responseData);
      isSuccess= true;
    }else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
