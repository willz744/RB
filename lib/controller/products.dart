import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/models/products.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/views/product_view.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:new_flut/widgets/text_field.dart';

class ProductData extends StatelessWidget {
   
  // final  productName;
  // final  productImage;
   Datum pDetails=Datum();
  // final double price;
   ProductData({Key? key,required this.pDetails }) : super(key: key);

  @override
  Widget build(BuildContext context) {
final appcolor=Appcolor();

    return Flexible(
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(8))),
         // margin: EdgeInsets.all(8.0),
         // height: 100,width: 40,
          
          child: Padding(
            padding:  EdgeInsets.only(left: 0.w),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
              InkWell(
                onTap: (){
                //  Get.to(()=>ProductDetialview(),arguments: [productImage,productName,price,productDescription]);
                },
                child: Container( height: 170,width: 170.w , decoration: BoxDecoration(
                  borderRadius:const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                  ),
                  child: FadeInImage.assetNetwork(placeholder: 'assets/images/onload.png', image: pDetails.picture.toString(),
                  
                  fit: BoxFit.fill,),
                   ),
              ),
              SizedBox(height:7.h),
              Padding(
                padding:  EdgeInsets.only(left: 8.w),
                child: HeaderP(color: appcolor.greyblack, text: '${pDetails.price.toString()}', fontsize: 14.sp),
              ),
              SizedBox(height:7.h),
           /*       Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: headerP(color: appcolor.greyblack, text: productName, fontsize: 12.sp)),
              ), */
              
          Padding(
            padding: EdgeInsets.only(left: 8.w,),
            child: Text(
        pDetails.itemName.toString(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style:  GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 13.sp,
            color: appcolor.greyblack,
            fontWeight: FontWeight.w700,),     
        ),
            ),
          ),
        
      
            ]),
          ),
        ),
      ),
    );
  }
}