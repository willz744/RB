import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Home.dart';

import '../Screens/Login.dart';

class CartController extends GetxController{
 var cart_items=[].obs;
 RxDouble total=0.0.obs;
  String item_name="";
  double item_price=0;
  String item_image="";
  var total_sum ;
  var total_item=0.obs;
  int item_qty=1;
 
     CartController(this.item_name,this.item_price,this.item_image,this.item_qty);

   addItem(){
   cart_items.value.add({"name":item_name,"price":item_price,"image":item_image,"qty":item_qty });
   total_item.value=cart_items.length;
  }
  void totalAmount(){
    for(var i=0; i<cart_items.length; i++){
       total_sum = cart_items[i]['price'] * cart_items[i]['qty'];
  }
  total=total_sum;
   }

   void increment(){
     item_qty++;
    for(var i=0; i<cart_items.length; i++){
      if(cart_items[i]['name']==item_name){
        cart_items[i]['qty']=item_qty;
      }
  }
   }

    void decrement(){
      item_qty--;
    for(var i=0; i<cart_items.length; i++){
      if(cart_items[i]['name']==item_name){
        cart_items[i]['qty']=item_qty;
      }
  }
   }


}
