import 'package:get/get.dart';
import 'package:new_flut/api_service/api_service.dart';
import 'package:new_flut/controller/products.dart';
import 'package:new_flut/models/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pcontroller extends GetxController{
  var product = [].obs;
RxBool isloading=false.obs;

Future getProducts(String id, String access)async{
  String page='1';
 product.value= await ApiService().getProdcuts({
    'user_id': id,
    'access_token': access,
    'page': page,
  });
}

Future getMoreProducts(String id, String access,int page)async{
 var getMore= await ApiService().getProdcuts({
    'user_id': id,
    'access_token': access,
    'page': page.toString()
  });
product.addAll(getMore);
print(product.length);
}
  

@override
void onInit(){
  
  super.onInit();
  
}
  
}