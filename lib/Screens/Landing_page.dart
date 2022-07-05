import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/Screens/Signup.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/text_button.dart';

import '../controller/cart_controller.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final appcolor=Appcolor();
 
 void initState() {

   super.initState();

 }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 50.h,left: 85.5.w),
              child: Text(
                'Welcome to RBuy',
                style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(
                      color: appcolor.greyblack,
                      fontSize: 18,
                    )
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 110.w),
              child: Text(
                'Explore Us',
                style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w500,
                    textStyle: TextStyle(
                      color: appcolor.grey,
                      fontSize: 17,
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 80.h,horizontal: 20.w),
              child: Image.asset(
                'assets/images/home.png',
                height: 230.h,
                width: 260.w,
              ),
            ),
           Textbutton(text: "Login", pageR: 'login',),
            SizedBox(height: 12.h),
            TextButton(onPressed: ()=> Get.to(Signup()),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 120.w),
                child: Text('Signup',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}