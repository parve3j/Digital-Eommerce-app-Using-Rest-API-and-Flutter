import 'package:get/get.dart';

class MainBottomNavController extends GetxController{
  int _selectedIndex = 0;
  int get currentIndex =>_selectedIndex;

  void changeIndex(int index){
    if(_selectedIndex==index){
      return;
    }else{
      _selectedIndex=index;
      update();
    }
  }
  void backHome(){
    changeIndex(0);
  }
}