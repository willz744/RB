import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Home.dart';
import 'package:new_flut/widgets/pass_field.dart';
import 'package:new_flut/widgets/text_field.dart';

import '../widgets/text_button.dart';
import 'signup.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
              Text('Login',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
              SizedBox(height:40.h),
            Textfield(icon: Icons.email_outlined, labeltxt: "Email"),
              SizedBox(height:40.h),
           Passfield(),
              SizedBox(height:50.h),
              Textbutton(text: "Login", pageR: 'home',),
              SizedBox(height:20.h),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w),
                    child: Text("Don't have an account ?",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                  ),
                  TextButton(onPressed: ()=> Get.to(Signup()),
                      child: const Text('Sign Up', style: TextStyle(color: Colors.black54),)
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
