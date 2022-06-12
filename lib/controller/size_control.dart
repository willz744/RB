import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Sizcontroller extends StatefulWidget {
  final String b1;
  const Sizcontroller({Key? key, required this.b1}) : super(key: key);

  @override
  State<Sizcontroller> createState() => _SizcontrollerState();
}

class _SizcontrollerState extends State<Sizcontroller> {

  var boxcolor=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
  onTap: Onclick,
      child: Container(
          decoration: BoxDecoration(
            color: boxcolor,
            borderRadius: BorderRadius.all(Radius.circular(3)) 
          ),
          height:40.h,width: 43.w,
          
         
        //  child: headerP(color: appcolor.grey, text: 'text', fontsize: fontsize),
        ),
    );
  }

  Onclick(){
    setState(() {
      boxcolor=Colors.blue;
    });
    return boxcolor;
  }
}

