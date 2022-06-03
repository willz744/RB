import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/widgets/Pass_field.dart';
import 'package:new_flut/widgets/Text_Button.dart';

import '../widgets/Text_field.dart';


class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: ()=>Get.back(),
                icon: Icon(Icons.arrow_back_outlined,color: Colors.black38,

                ),
              ),
              SizedBox(height:20.h),
              Text('Signup',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
              SizedBox(height:40.h),
              Textfield(icon: Icons.person, labeltxt: "Name"),
              SizedBox(height:40.h),
              Textfield(icon: Icons.email_outlined, labeltxt: "Email"),
              SizedBox(height:40.h),
             Passfield(),
              SizedBox(height:50.h),
              Textbutton(text: "Sign Up", pageR: '',),
              SizedBox(height:20.h),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w),
                    child: Text("Already have an account ?",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                  ),
                  TextButton(onPressed: ()=> Get.to(Login()),
                      child: Text('Sign in', style: TextStyle(color: Colors.black54),)
                  )
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
