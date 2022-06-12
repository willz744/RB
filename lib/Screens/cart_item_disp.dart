import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_flut/controller/cart_controller.dart';

class CartDisp extends StatefulWidget {
  
  final index;

  const CartDisp({Key? key,required this.index}) : super(key: key);

  @override
  State<CartDisp> createState() => _CartDispState();
}

class _CartDispState extends State<CartDisp> {
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
    return Container(
height: 100.h, width: 60.w,
decoration: BoxDecoration(
  boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(5,10),
                blurRadius: 8.0,
                spreadRadius: 4
            )],
            color: Colors.white,
),
child: Row(children: [
  Image.network(image),
  Column(
    children: [
      Text(name),
      Text(price.toString()),
      Container(
        child: Row(children: [
          GestureDetector(child: Text('-'),),
          Text(qty.toString()),
           GestureDetector(child: Text('+'),),
        ]),
      )
    ],
  )
]),
    );
  }
}