import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';

import '../Screens/Home.dart';

class PageR{
   String pager;
      PageR({required this.pager});
void route(){
  switch(pager){
    case 'login':
      Get.to(Login());
      break;
    case 'home':
      Get.to(HomeP());
      break;
  }
}



  }
