import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/screens/checkout_page.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:new_flut/widgets/text_button.dart';



class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

 

  @override
  Widget build(BuildContext context) {
    var appcolor=Appcolor();
    final cartCtrl=Get.find<CartController>();
    String img='https://www.bankofthejames.bank/wp-content/uploads/2016/02/botj_card.jpg';
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.white70.withOpacity(0.975),
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 48.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: Colors.white70.withOpacity(0.975),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      IconButton(onPressed: ()=>Get.back(),
                          icon: Icon(Icons.arrow_back_outlined,size: 18.sp,color: Colors.black54,)),
                      
                       
                        
                    ],
                  ),
                   SizedBox(height:3.h),
                   
            ]),
          )),
          ) ,
               body:  Padding(
                 padding:  EdgeInsets.only(left: 20.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding:  EdgeInsets.only(top: 10.h,left: 10.w),
                       child: HeaderP(color: appcolor.black, text: 'Payment', fontsize: 25.sp),
                     ),

                    Padding(
                      padding:  EdgeInsets.only(top: 10.h,left: 10.w,bottom: 20.h),
                      child: Image.network( img,
                      height: 200.h,
                      width: 300.w,
                      ),
                    ),
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HeaderP(color: appcolor.grey, text: 'Subtotal', fontsize: 15.sp),
                        Padding(
                          padding: EdgeInsets.only(left: 180.w,),
                          child: HeaderP(color: appcolor.grey, text: '\$${cartCtrl.total}', fontsize: 15.sp),
                        )
                      ],
                    ),
                     Padding(
                       padding: EdgeInsets.only(top: 40.h,),
                       child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HeaderP(color: appcolor.grey, text: 'Shipping', fontsize: 15.sp),
                          Padding(
                            padding: EdgeInsets.only(left: 180.w,),
                            child: HeaderP(color: appcolor.grey, text: '\$${cartCtrl.shippingFee}', fontsize: 15.sp),
                          )
                        ],
                    ),
                     ),
                 Divider(),

                 Padding(
                       padding: EdgeInsets.only(top: 10.h,),
                       child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HeaderP(color: appcolor.grey, text: 'Total', fontsize: 15.sp),
                          Padding(
                            padding: EdgeInsets.only(left: 200.w,),
                            child: HeaderP(color: appcolor.grey, text: '\$${cartCtrl.realTotal}', fontsize: 15.sp),
                          )
                        ],
                    ),
                     ),
  
                 Padding(
        padding: EdgeInsets.only(left: 0.w,right: 20.w,top: 90.h),
        child: Container(
          height: 44.0,
          decoration:  BoxDecoration(
            border:  Border.all(style: BorderStyle.solid,
            color: appcolor.blue
            ),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: ElevatedButton(
            onPressed: () {
              
            },
            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 100.w),
              child: Text('Add Card',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: appcolor.blue,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300
                    )
                ),


              ),
            ),
          ),
        )
    ),

    Padding(
        padding: EdgeInsets.only(left: 0.w,right: 20.w,top: 20.h),
        child: Container(
          height: 44.0,
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              
          ),
          child: ElevatedButton(
            onPressed: () {
             Get.to(CheckoutPage());
             cartCtrl.totalAmount();
            },
            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 100.w),
              child: Text('Checkout',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: appcolor.verywhite,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400
                    )
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