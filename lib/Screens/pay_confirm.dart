import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/screens/checkout_page.dart';
import 'package:new_flut/screens/home.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:new_flut/widgets/text_button.dart';



class PayConfirm extends StatefulWidget {
  const PayConfirm({Key? key}) : super(key: key);

  @override
  State<PayConfirm> createState() => _PayConfirmState();
}

class _PayConfirmState extends State<PayConfirm> {

 

  @override
  Widget build(BuildContext context) {
    var appcolor=Appcolor();
    final cartCtrl=Get.find<CartController>();
    String img='https://toppng.com/public/uploads/thumbnail/thumbs-up-palets-vverkh-i-palets-vniz-11563269315ayc1avtfpp.png';
    return Scaffold(
       
               body:  Padding(
                 padding:  EdgeInsets.only(left: 10.w,top: 20.h),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
              
                  
                  Stack(
                    children: [
                       Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Container(
                      height: 230.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 244, 245).withOpacity(0.8),
                        shape: BoxShape.circle
                      ),
                     
                    ),
                  ), 

                    Padding(
                      padding: EdgeInsets.only(top: 80.h),
                      child: Container(
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 154, 193, 196).withOpacity(0.7),
                          shape: BoxShape.circle
                        ),
                        ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 120.h,left: 130.w),
                      child: Image.network(img,height: 70.h,),
                    ),
                    ],
                  ),
                  

                  Padding(
                       padding:  EdgeInsets.only(top: 30.h,left: 90.w,right: 20.w),
                       child: HeaderP(color: appcolor.black, text: 'Confirmation', fontsize: 25.sp),
                     ),

                     Padding(
                       padding:  EdgeInsets.only(top: 30.h,left: 60.w,right: 40.w),
                       child: HeaderP(color: appcolor.grey, text: 'You have successfully completed your payment', fontsize: 15.sp),
                     ),

                    
                 
                 Padding(
                padding: EdgeInsets.only(left: 0.w,right: 20.w,top: 180.h),
                 child: Container(
                   decoration: BoxDecoration(
                   boxShadow: [BoxShadow(
                    color: Color.fromARGB(255, 226, 198, 198).withOpacity(0.6),
                    offset: const Offset(3,10),
                     blurRadius: 8.0,
                    spreadRadius: 3
              )],
          ),
          child: Container(
            height: 44.0,
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                
            ),
            child: ElevatedButton(
              onPressed: () {
               Get.to(HomeP());
               
              },
              style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 100.w),
                child: Text('Back to Home',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: appcolor.verywhite,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700
                      )
                  ),
        
        
                ),
              ),
            ),
          ),
        )
    ),
    
                   ],
                 ),
               )
               
               
    );
  }
}