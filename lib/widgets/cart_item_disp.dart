import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/header_p.dart';

class CartDisp extends StatefulWidget {
  
  final int index;

  const CartDisp({Key? key,required this.index}) : super(key: key);

  @override
  State<CartDisp> createState() => _CartDispState();
}

class _CartDispState extends State<CartDisp> {
  
  var appcolor=Appcolor();
   String name="";
   String image="";
   double price=0;
   int qty=0;
  final cartctrl=Get.find<CartController>();
  @override
void initState() {
  super.initState();
 setState(() {
 name=cartctrl.cart_items[widget.index]['name'];
  image=cartctrl.cart_items[widget.index]['image'];
   price=cartctrl.cart_items[widget.index]['price'];
    qty=cartctrl.cart_items[widget.index]['qty'];
 });
}
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 10.w,right: 20.w,top: 40.h),
      child: Container(
                  height: 130.h, width: 280.w,
                  decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(5,10),
                  blurRadius: 8.0,
                  spreadRadius: 4
              )],
              color: Colors.white,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Image.network(image,width: 150.w,height: 95.h,),
        // Container(height: 50,width: 50,color: Colors.amber,),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                //mainAxisAlignment:MainAxisAlignment.start,
               // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding:  EdgeInsets.only(top: 10.h,),
                child: Container(
                  width: 120.w,
                  child: Text(
                             name,
                               maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:  GoogleFonts.lato(
                               textStyle: TextStyle(fontSize: 12.sp,
                                 color: appcolor.greyblack,
                                   fontWeight: FontWeight.w700,),     
                              ),
              ),
                ),
              ),
           SizedBox(height: 10.h,),     
           HeaderP(color: appcolor.blue, text: '\$${price.toString()}', fontsize: 14.sp),
         SizedBox(height: 20.h,),
         Container(
           width: 120.w,height: 35.h,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(3)),
               color: appcolor.grey
           ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              GestureDetector(
                onTap: (){
                  cartctrl.decrement();
                  cartctrl.totalAmount();
                  
                 },
                child: HeaderP(color: appcolor.black, text: '-', fontsize: 18.sp),),
        Obx(()=>   Text(cartctrl.qties[widget.index].toString()),),
               GestureDetector(
                 onTap: (){
                  cartctrl.increment();
                  cartctrl.totalAmount();
                  print('pressed');
                  
                 },
                 child: HeaderP(color: appcolor.black, text: '+', fontsize: 18.sp),),
          ]),
        )
      ],
  ),
            ),
    Align(
      alignment: Alignment.topLeft,
      child: IconButton(onPressed: (){cartctrl.del(widget.index);}, 
      iconSize: 16.sp,
      icon: Icon(Icons.close_outlined))) 
]),
      ),
    );
}}