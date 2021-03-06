import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Home.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/cart_icon.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:carousel_slider/carousel_slider.dart';




class ProductDetialview extends StatefulWidget {
  const ProductDetialview({Key? key}) : super(key: key);

  @override
  State<ProductDetialview> createState() => _ProductDetialviewState();
}

class _ProductDetialviewState extends State<ProductDetialview> {
   final appcolor =Appcolor();

   Color c1=Colors.grey.withOpacity(0.2);
    Color c2=Colors.grey.withOpacity(0.2);
 Color c3=Colors.grey.withOpacity(0.2);
  Color c4=Colors.grey.withOpacity(0.2);

  Color ct1=Colors.grey;
    Color ct2=Colors.grey;
 Color ct3=Colors.grey;
  Color ct4=Colors.grey;
var productdetialData= Get.arguments;

var cart_ctrl;
   @override
void initState() {
  super.initState();
 
 
     cart_ctrl=Get.put(CartController(productdetialData[1], productdetialData[2], productdetialData[0], 1));
 
}
  @override
  Widget build(BuildContext context) {
     List img=[];
     img=[productdetialData[0],productdetialData[0],productdetialData[0]];
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70.withOpacity(0.975),
          automaticallyImplyLeading: false,
          elevation: 1,
          toolbarHeight: 50.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: Colors.white70.withOpacity(0.975),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      IconButton(onPressed: ()=>Get.to(HomeP()),
                          icon: Icon(Icons.arrow_back_outlined,size: 18.sp,color: Colors.black54,)),
                      Padding(
                        padding:  EdgeInsets.only(left: 190.w),
                        child: IconButton(onPressed: (){},
                            icon: Icon(Icons.search)),
                      ),
                       CartIcon()
                        
                    ],
                  ),
                   SizedBox(height:3.h),
                   
            ]),
          )),
          ) ,
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
               Padding(
                 padding:  EdgeInsets.only(left: 20.w, top: 30.h, right: 20.w),
                 child: Container(
                  height: 170.h, width: 320.w,
                
                child:CarouselSlider(
                       options: CarouselOptions(
                          aspectRatio: 0.2,
                           enlargeCenterPage: true,
                           enableInfiniteScroll: true,
                           viewportFraction: 1,
                           initialPage: 0,
                           autoPlay: false,
                       ),
                        items: img
                        .map((item) => Container(
                         child: Center(
                           child:
                           Image.network(item, fit: BoxFit.fill,width: 320.w,)),
                       ))
                     .toList(),
                        ) 
              ),
               ),

             SizedBox(height:10.h),
             Padding(
               padding:  EdgeInsets.only(left: 20.w),
               child: HeaderP(color: appcolor.greyblack, text: productdetialData[1], fontsize: 20.sp),
             ),
             SizedBox(height:10.h),

              Padding(
               padding:  EdgeInsets.only(left: 20.w),
               child: HeaderP(color: appcolor.blue, text: '\$${productdetialData[2].toString()}', fontsize: 16.sp),
             ),
             SizedBox(height:10.h),

             Padding(
               padding: EdgeInsets.only(left: 20.w,right: 20.w),
               child: Divider(),
             ),

Row(
  children: [
 Padding(
        padding:  EdgeInsets.only(left: 20.w),
        child: Container(
          height: 27.h,width: 60.w,
          decoration: BoxDecoration(
            color: appcolor.blue,
            borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: HeaderP(color: appcolor.verywhite, text: '4.5', fontsize: 16.sp)),
        ),
      ),
 Padding(
   padding: EdgeInsets.only(left: 20.w),
   child: HeaderP(color: appcolor.greyblack, text: 'Very Good', fontsize: 15.sp),
 ),
 Padding(
   padding: EdgeInsets.only(left: 70.w),
   child: HeaderP(color: appcolor.blue, text: '49 Review(s)', fontsize: 12.sp),
 ),

  ],
),
     
             Padding(
               padding: EdgeInsets.only(left: 20.w,right: 20.w),
               child: Divider(),
             ),

          Padding(
           padding: EdgeInsets.only(left: 20.w),
           child: HeaderP(color: appcolor.grey, text: 'Description', fontsize: 14.sp),
                  ),
          
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w,top: 10.h,bottom: 40.h),
            child: Text(productdetialData[3],
    //overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: appcolor.grey,
                          fontSize: 11.sp,
                          //fontWeight: FontWeight.w600
                      )
                  ),
                ),
          ),

           Padding(
               padding: EdgeInsets.only(left: 20.w,right: 20.w),
               child: Divider(),
             ),

         Center(
           child:  HeaderP(color: appcolor.black, text: 'Select Size', fontsize: 16.sp),
         ),

              Padding(
               padding: EdgeInsets.only(left: 20.w,right: 20.w),
               child: Divider(),
             ),

             
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                InkWell(
            onTap: b1,
             child: Container(
          decoration: BoxDecoration(
            color: c1,
            borderRadius: BorderRadius.all(Radius.circular(3)) 
          ),
          height:40.h,width: 43.w,
               
         child: Center(child: HeaderP(color: ct1, text: 'S', fontsize: 15.sp)),
        ),
    ),
    InkWell(
            onTap: b2,
             child: Container(
          decoration: BoxDecoration(
            color: c2,
            borderRadius: BorderRadius.all(Radius.circular(3)) 
          ),
          height:40.h,width: 43.w,
               
          child: Center(child: HeaderP(color: ct2, text: 'M', fontsize: 15.sp)),
        ),
    ),
    InkWell(
            onTap: b3,
             child: Container(
          decoration: BoxDecoration(
            color: c3,
            borderRadius: BorderRadius.all(Radius.circular(3)) 
          ),
          height:40.h,width: 43.w,
               
          child: Center(child: HeaderP(color: ct3, text: 'L', fontsize: 15.sp)),
        ),
    ),
    InkWell(
            onTap: b4,
             child: Container(
          decoration: BoxDecoration(
            color: c4,
            borderRadius: BorderRadius.all(Radius.circular(3)) 
          ),
          height:40.h,width: 43.w,
               
        child: Center(child: HeaderP(color: ct4, text: 'XL', fontsize: 15.sp)),
        ),
    ),
                  
               ],
             ),

             Padding(
               padding:  EdgeInsets.only(top: 24.h,left: 10.w,right: 10.w),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
  Expanded(
    child: InkWell(
                onTap: (){
                  cart_ctrl.addItem();
                  Get.snackbar('Notice', 'Added to cart successfully',
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.blue,
               borderRadius: 10,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 2),
               isDismissible: true,
               forwardAnimationCurve: Curves.easeOutBack,
                  );
                },
                 child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(1)) 
            ),
            height:50.h,width: 100.w,
                   
          child: Center(child: HeaderP(color: Colors.black, text: 'ADD TO CART', fontsize: 15.sp)),
          ),
      ),
  ),
    Expanded(
      child: InkWell(
                onTap: b4,
                 child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(1)) 
            ),
            height:50.h,width: 100.w,        
          child: Center(child: HeaderP(color: Colors.white, text: 'BUY NOW', fontsize: 15.sp)),
          ),
      ),
    ),
],

               ),
             ),

          ]),
        
      ),
    );
  }
  b1(){
  setState(() {
    c1=Colors.blue;
    c2=Colors.grey.withOpacity(0.2);
    c3=Colors.grey.withOpacity(0.2);
    c4=Colors.grey.withOpacity(0.2);
     ct1=Colors.white;
     ct2=Colors.grey;
  ct3=Colors.grey;
   ct4=Colors.grey;
  });
  }
   b2(){
  setState(() {
    c1=Colors.grey.withOpacity(0.2);
    c2=Colors.blue;
    c3=Colors.grey.withOpacity(0.2);
    c4=Colors.grey.withOpacity(0.2);
      ct1=Colors.grey;
     ct2=Colors.white;
  ct3=Colors.grey;
   ct4=Colors.grey;
  });
  }
   b3(){
  setState(() {
    c1=Colors.grey.withOpacity(0.2);
    c2=Colors.grey.withOpacity(0.2);
    c3=Colors.blue;
    c4=Colors.grey.withOpacity(0.2);

      ct1=Colors.grey;
     ct2=Colors.grey;
  ct3=Colors.white;
   ct4=Colors.grey;
  });
  }
   b4(){
  setState(() {
    c1=Colors.grey.withOpacity(0.2);
    c2=Colors.grey.withOpacity(0.2);
    c3=Colors.grey.withOpacity(0.2);
    c4=Colors.blue;
      ct1=Colors.grey;
     ct2=Colors.grey;
  ct3=Colors.grey;
   ct4=Colors.white;
  });
  }

}