import 'package:ecom_project_using_rest_api/presentation/state_holders/cart_controller.dart';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utlity/urls.dart';

class CartDeleteController extends GetxController{
  bool _inProgress = false;
  bool get inProgress=>_inProgress;
  String _errorMessage='';
  String get errorMessage => _errorMessage;


  Future<bool> deleteCart(String token, int productId) async{
    bool isSuccess =  false;
    _inProgress= true;
    update();
    final response = await NetworkCaller().getRequest(Urls.deleteCart(productId), token: token);
    _inProgress=false;
    if(response.isSuccess){
      // await Get.find<CartListController>().cartModel.cartList?.removeWhere((item)=>item.productId==productId);
      isSuccess= true;
    }else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
