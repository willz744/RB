import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeController extends GetxController{

   var boxcolor=Colors.grey.obs;

   Onclick(){
     boxcolor.value=Colors.blue;
    return boxcolor;
  }
}