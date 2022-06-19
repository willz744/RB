
import 'package:get/get.dart';
import 'package:new_flut/Screens/Home.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/screens/address_page.dart';
import 'package:new_flut/screens/pay_confirm.dart';


class PageR{
   String pager;
      PageR({required this.pager});
void route(){
  switch(pager){
    case 'login':
      Get.to(const Login());
      break;
    case 'home':
      Get.to(const HomeP());
      break;
    case 'address':
      Get.to(const AddressPage());
      break;
    case 'pay':
      Get.to(const PayConfirm());
      break;
  }
}



  }
