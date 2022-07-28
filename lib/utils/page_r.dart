
import 'package:get/get.dart';
import 'package:new_flut/Screens/Home.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/api_service/api_service.dart';
import 'package:new_flut/api_service/otp_service.dart';
import 'package:new_flut/screens/address_page.dart';
import 'package:new_flut/screens/pay_confirm.dart';


class PageR{
   String pager;
   String ?account="";
   String ?password;
      PageR({required this.pager,this.account,this.password});
void route(){
  switch(pager){
    case 'login':
      Get.to(const Login(),duration:const Duration(seconds: 1),transition: Transition.circularReveal);
      break;
    case 'home':
      Get.to(const HomeP(),duration:const Duration(seconds: 1),transition: Transition.zoom);
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
