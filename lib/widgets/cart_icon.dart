import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/views/cart_view.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartctrl=Get.find<CartController>();
    return Stack(
     children: [
       IconButton(onPressed: (){
         Get.to(cartView());
       }, icon: Icon(Icons.shopping_cart_outlined)),
       Padding(
         padding:  EdgeInsets.only(left: 25.w,top: 7.h),
         child: Container(
           height: 15.h,width: 15.w,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Colors.orange
           ),
           child: Center(child: Obx(()=> Text(cartctrl.total_item.toString(),style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.w500),))),),
       ),
     ],
    );
  }
}