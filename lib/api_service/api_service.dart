import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_flut/screens/home.dart';
import 'package:new_flut/screens/login.dart';
import 'package:new_flut/screens/otp_verify.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/utils/page_r.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService{

String baseUrl='https://ecommerce.enlightenbuddy.com/';
final appcolor=Appcolor();

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future saveId(String userId,String accessToken)async{
 SharedPreferences prefs =  await _prefs;
prefs.setStringList('id', ['$userId','$accessToken']);
}


Future signUp(Map<String,String> data ) async{
final resp= await http.post(Uri.parse(baseUrl+'api/user/register'),

  body: data,
  );
  print('Response status: ${resp.body}');
 
  var datajson=json.decode(resp.body);
   print(datajson['success']);
  if(datajson['success']){
    saveId(datajson['data']['user_id'], datajson['data']['access_token']);
    Get.snackbar('', 'Registration successful',
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
               snackPosition: SnackPosition.TOP,
               backgroundColor: Colors.blue,
               borderRadius: 10,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 2),
               isDismissible: true,
               forwardAnimationCurve: Curves.easeOutBack,
                  );
                  Get.off(const OtpPage()); 
  }
  else{
    print(datajson['error']);
     Get.snackbar('', "${datajson['error']}",
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
               snackPosition: SnackPosition.TOP,
               backgroundColor: appcolor.blue,
               borderRadius: 10,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
               forwardAnimationCurve: Curves.easeOutBack,
                  );
  }
 
 
 

}


Future signIn(Map<String,String> data) async{
  
final resp= await http.post(Uri.parse(baseUrl+'api/user/login'),

  body: data,
  );
  print('Response status: ${resp.body}');
 
  var datajson=json.decode(resp.body);
   print(datajson['success']);
  if(datajson['success']){
    saveId(datajson['data']['user_id'], datajson['data']['access_token']).then((value) {print('saved');});
  
      Get.off(const HomeP()); 
  }
  else{
    print(datajson['error']);
     Get.snackbar('', "${datajson['error']}",
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
               snackPosition: SnackPosition.TOP,
               backgroundColor: appcolor.blue,
               borderRadius: 10,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
               forwardAnimationCurve: Curves.easeOutBack,
                  );
  }
}

Future getProdcuts(Map<String,String> data) async{
final resp= await http.post(Uri.parse(baseUrl+'api/user/items/latest'),

  body: data,
  );
  print('Response status: ${resp.body}');
 
  var datajson=json.decode(resp.body);
   
  if(datajson['success']){
    print(datajson["data"]);
  return datajson["data"];
      
  }
  else{
    print(datajson['error']);
     Get.snackbar('', "${datajson['error']}",
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
               snackPosition: SnackPosition.TOP,
               backgroundColor: appcolor.blue,
               borderRadius: 10,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
               forwardAnimationCurve: Curves.easeOutBack,
                  );
  }
}


}