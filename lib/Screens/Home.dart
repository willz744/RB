import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';


class HomeP extends StatelessWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.menu_open_rounded,size: 35.sp,color: Colors.black54,)),
                    Padding(
                      padding:  EdgeInsets.only(left: 190.w),
                      child: IconButton(onPressed: (){},
                          icon: Icon(Icons.notifications_none_sharp)),
                    ),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.filter_alt_outlined,color: Colors.black54,)),

                  ],
                ),
                SizedBox(height:20.h),
                Padding(
                  padding:  EdgeInsets.only(left: 40.w),
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: const Offset(5,10),
                            blurRadius: 8.0,
                            spreadRadius: 4
                        )]
                    ),


                    child: TextField(

                      cursorColor: Colors.black54,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,color: Colors.black54,),
                          hintText: 'Search Your Product',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                            // borderSide: BorderSide.lerp(2.0, b, t)
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

      ),
    );
  }
}
