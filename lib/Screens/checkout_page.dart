import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/cart_item_disp.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:new_flut/widgets/text_button.dart';


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  //List<Map<String, dynamic>> cart_items=[];
  final cart_ctrl=Get.find<CartController>();

@override
void initState() {
  super.initState();
 setState(() {
//print(cart_ctrl.cart_items);
 });
}

  @override
  Widget build(BuildContext context) {
    var appcolor=Appcolor();
    var cartCtrl=Get.find<CartController>();
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.white70.withOpacity(0.975),
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 50.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: Colors.white70.withOpacity(0.975),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      IconButton(onPressed: ()=>Get.back(),
                          icon: Icon(Icons.arrow_back_outlined,size: 18.sp,color: Colors.black54,)),
                      Padding(
                        padding:  EdgeInsets.only(left: 190.w),
                        child: IconButton(onPressed: (){},
                            icon: Icon(Icons.search)),
                      ),
                       
                        
                    ],
                  ),
                   SizedBox(height:3.h),
                   
            ]),
          )),
          ) ,
               body:  Obx(()=>(Stack(
                   children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 10.w,bottom: 10.h),
                        child: HeaderP(color: appcolor.greyblack, text: 'Checkout', fontsize: 22.sp),
                      ),
                     Padding(
                       padding:  EdgeInsets.only(top: 25.h,),
                       child: Container(
                         height: 270.h,color: appcolor.verywhite,
                         child: Obx(()=> ListView.builder(
                    itemCount: cart_ctrl.cart_items.length,
                    itemBuilder:  (BuildContext context,int index){
                   return CartDisp(index: index);
                         }),),
                       ),
                     ),
                      
                      Padding(
                        padding: EdgeInsets.only(top: 300.h,left: 20.w),
                        child: HeaderP(color: appcolor.greyblack, text: 'No 9 eltebera eststae nsukka', fontsize: 14.sp),
                      ),
                 Padding(
                   padding: EdgeInsets.only(top: 340.h,left: 20.w),
                   child: Divider(),
                 ),
                      Padding(
                       padding: EdgeInsets.only(top: 350.h,left: 20.w),
                       child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HeaderP(color: appcolor.grey, text: 'Subtotal', fontsize: 15.sp),
                          Padding(
                            padding: EdgeInsets.only(left: 200.w,),
                            child: HeaderP(color: appcolor.grey, text: '\$${cartCtrl.total}', fontsize: 15.sp),
                          )
                        ],
                    ),
                     ),

                     Padding(
                       padding: EdgeInsets.only(top: 390.h,left: 20.w),
                       child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HeaderP(color: appcolor.grey, text: 'Shipping', fontsize: 15.sp),
                          Padding(
                            padding: EdgeInsets.only(left: 200.w,),
                            child: HeaderP(color: appcolor.grey, text: '\$${cartCtrl.shippingFee}', fontsize: 15.sp),
                          )
                        ],
                    ),
                     ),

                     Padding(
                   padding: EdgeInsets.only(top: 410.h,left: 20.w),
                   child: Divider(),
                 ),

                 Padding(
                       padding: EdgeInsets.only(top: 430.h,left: 20.w),
                       child: Row(
                       
                        children: [
                          HeaderP(color: appcolor.grey, text: 'Total', fontsize: 15.sp),
                          Padding(
                            padding: EdgeInsets.only(left: 220.w,),
                            child: HeaderP(color: appcolor.grey, text: '\$${cartCtrl.realTotal}', fontsize: 15.sp),
                          )
                        ],
                    ),
                     ),

                       Padding(
                         padding:  EdgeInsets.only(top: 550.h,left: 30.w),
                        child: const Textbutton(text: 'Buy', pageR: 'pay')),


                   ],
                 ))
               
               
    ));
  }
}