import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_flut/controller/cart_controller.dart';

import '../Screens/cart_item_disp.dart';

class cartView extends StatefulWidget {
  const cartView({Key? key}) : super(key: key);

  @override
  State<cartView> createState() => _cartViewState();
}

class _cartViewState extends State<cartView> {

  //List<Map<String, dynamic>> cart_items=[];
  final cart_ctrl=Get.find<CartController>();

@override
void initState() {
  super.initState();
 setState(() {
print(cart_ctrl.cart_items);
 });
}

  @override
  Widget build(BuildContext context) {
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
     body: ListView.builder(
       itemCount: cart_ctrl.cart_items.length,
       itemBuilder:  (BuildContext context,int index){
       return CartDisp(index: index,);
       }),
    );
  }
}