import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 50.h),
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
            TextField(
              cursorColor: Colors.black38,
              style: TextStyle(color: Colors.black54),
              decoration: InputDecoration(
             //   prefixIconColor: Colors.black38,
                prefixIcon: const Icon(Icons.email_outlined,color: Colors.black38,),
                labelText: 'Email',
               labelStyle: TextStyle(
                 color: Colors.black38
               ),
               focusedBorder: OutlineInputBorder(

                 borderSide: BorderSide(
                   color: Colors.black38
                 )
               )
              ),
            ),
            SizedBox(height:40.h),
            TextField(
              cursorColor: Colors.black38,
              style: TextStyle(color: Colors.black54),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_open,color: Colors.black38,),
                  suffixIcon: Icon(Icons.visibility,color: Colors.black38,),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.black38
                  ),
                  focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(
                          color: Colors.black38
                      )
                  )
              ),
            ),
            SizedBox(height:50.h),
            Padding(
                padding: EdgeInsets.only(left: 25.w,right: 25.w),
                child: Container(
                  height: 44.0,
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 85.w),
                      child: Text('Log in',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w300
                            )
                        ),


                      ),
                    ),
                  ),
                )
            ),
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
                TextButton(onPressed: (){},
                    child: Text('Sign Up', style: TextStyle(color: Colors.black54),)
                )
              ],
            ),
          ],

        ),
      ),
    );
  }
}
