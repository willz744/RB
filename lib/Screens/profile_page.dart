import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/header_p.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appcolor=Appcolor();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(242,242,242,242),
    appBar: AppBar(
          backgroundColor: appcolor.white_tint,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 50.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: appcolor.white_tint,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      IconButton(onPressed: ()=>Get.back(),
                          icon: Icon(Icons.arrow_back_outlined,size: 20.sp,color: appcolor.tint_grey,)),      
                    Padding(
                      padding:  EdgeInsets.only(left: 100.w),
                      child: HeaderP(color: appcolor.tint_grey, text: 'Profile', fontsize: 15.sp),
                    )
                    ],
                  ),
                   SizedBox(height:3.h),
                   
            ]),
          )),
          ) ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100.h,width: double.infinity,
              color: appcolor.white_tint,
              child:Column(
                children: [
                  rowData('Photo', 13.sp,Image.asset('assets/images/avatar.png',height: 60.h,width: 60.w,)),
                  Divider(height: 2.h,),
                  SizedBox(height: 5.h,),
                  rowData('Member Center', 13.sp,Text('Platinium member',style: TextStyle(color: appcolor.grey),)),
                ],
              ),
            ),
            SizedBox(height: 8.h,),
             Container(
              height: 124.h,width: double.infinity,
              color: appcolor.white_tint,
              child:Column(
                children: [
                  SizedBox(height: 8.h,),
                  rowData('Account Info', 13.sp,Text('Platinium member',style: TextStyle(color: appcolor.grey))),
                  SizedBox(height: 8.h,),
                  Divider(height: 2.h,),
                   SizedBox(height: 8.h,),
                  rowData('Name', 13.sp,Text('Agbo william',style: TextStyle(color: appcolor.grey))),
                   SizedBox(height: 8.h,),
                    Divider(height: 2.h,),
                     SizedBox(height: 8.h,),
                  rowData('Gender', 13.sp,Text('',style: TextStyle(color: appcolor.grey))),
                   SizedBox(height: 8.h,),
                    
                    
                ],
              ),
            ),
            SizedBox(height: 8.h,),
             Container(
                     height: 42.h,width: double.infinity,
                      color: appcolor.white_tint,
                      child:Column(
                      children: [
                         SizedBox(height: 8.h,),
                      rowData('Shipping Address', 13.sp,Text('',style: TextStyle(color: appcolor.grey))),
                      
                       
                ],
              ),
            ),
           
              
          ],
        ),
      ),
    );
  }
  
  Widget rowData(String text,double fontsize, Widget wig) {
    final appcolor=Appcolor();
    return Padding(
      padding:  EdgeInsets.only(left: 10.w,right: 10.w),
      child: Row(
        children: [
          Text(text,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: appcolor.black,
                        fontSize: fontsize,
                        fontWeight: FontWeight.w400
                    )
                ),
              ),
              
                Spacer(),
                wig,
                Icon( CupertinoIcons.chevron_forward,size: 19.sp,color: appcolor.tint_grey,),
              
        ],
      ),
    );
  }
}
