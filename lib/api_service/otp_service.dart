import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_flut/Screens/Login.dart';

class OtpService{
 String network_otp="";
String Url= 'https://ecommerce.enlightenbuddy.com/api/user/otp/verification';

Future verifyOtp(String otp, String user_id, String access_token)async{
  final resp= await http.post(Uri.parse(Url),
   body: {
    'verification_code':otp,
    'user_id': user_id,
    'access_token': access_token
   }
  );
  var datajson=json.decode(resp.body);
  if(datajson['success']){
    Get.snackbar('', 'Otp verified',
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
               snackPosition: SnackPosition.TOP,
               backgroundColor: Colors.blue,
               borderRadius: 10,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: const Duration(seconds: 2),
               isDismissible: true,
               forwardAnimationCurve: Curves.easeOutBack,
                  );
                  Get.off(const Login());
  }
  else{
     Get.snackbar('', 'Wrong otp',
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
               snackPosition: SnackPosition.TOP,
               backgroundColor: Colors.blue,
               borderRadius: 10,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: const Duration(seconds: 2),
               isDismissible: true,
               forwardAnimationCurve: Curves.easeOutBack,
                  );
                  Get.off(const Login());
  }
}
}