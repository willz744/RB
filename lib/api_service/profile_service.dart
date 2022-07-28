import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_flut/models/profile.dart';
import 'package:new_flut/screens/home.dart';
import 'package:new_flut/screens/login.dart';
import 'package:new_flut/screens/otp_verify.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/utils/page_r.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService{

String baseUrl='https://ecommerce.enlightenbuddy.com/';
final appcolor=Appcolor();

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future saveId(String userId,String accessToken)async{
 SharedPreferences prefs =  await _prefs;
prefs.setStringList('id', ['$userId','$accessToken']);
}


Future getProfile(Map<String,String> data ) async{
final resp= await http.post(Uri.parse(baseUrl+'api/user/profile'),

  body: data,
  );
  
  var datajson=json.decode(resp.body);

 return datajson;
   
  
 
}





}