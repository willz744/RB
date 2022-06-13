import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/views/product_disp.dart';
import 'package:new_flut/widgets/search_bar.dart';
import 'package:new_flut/widgets/header_p.dart''';




class HomeP extends StatelessWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String Image_woman='https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?b=1&k=20&m=1294339577&s=170667a&w=0&h=_5-SM0Dmhb1fhRdz64lOUJMy8oic51GB_2_IPlhCCnU=';
    final String Image_man='https://media.istockphoto.com/photos/smiling-indian-man-looking-at-camera-picture-id1270067126?k=20&m=1270067126&s=612x612&w=0&h=ZMo10u07vCX6EWJbVp27c7jnnXM2z-VXLd-4maGePqc=';
    final String Image_kid='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPsto0hEV_Zr-fKwxWODIAqe5YZvj82TS_Qg&usqp=CAU';
    final appcolor=Appcolor();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70.withOpacity(0.975),
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 100.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: Colors.white70.withOpacity(0.975),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.menu_open_rounded,size: 35.sp,color: Colors.black54,)),
                      Padding(
                        padding:  EdgeInsets.only(left: 190.w),
                        child: IconButton(onPressed: (){},
                            icon: Icon(Icons.notifications_none_sharp)),
                      ),
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.filter_alt_outlined,color: Colors.black54,)),
                        
                    ],
                  ),
                   SizedBox(height:3.h),
                   Searchbar(),
            ]),
          )),
          ) ,
        backgroundColor: Colors.white70.withOpacity(0.975),
          body:Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                 
                   SizedBox(height:20.h),
                  HeaderP(color: appcolor.greyblack, text: "Categories", fontsize: 20.sp,),
                  SizedBox(height:20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(3,6),
                  blurRadius: 5.0,
                  spreadRadius: 1
              )],
                      image: DecorationImage(image: NetworkImage(Image_woman),
                     
                      fit: BoxFit.cover
                      ),
                      
                    
                    ),
                    height: 35.h, width: 105.w,
                    child: InkWell(
                    
                      child: Stack(
                      children: [
                     Container(
                        height: 35.h, width: 105.w,
                       
                       decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(7) ),
                        color: Colors.lightBlueAccent.withOpacity(0.4),
                       ),
                       child: Align(
                         alignment: Alignment.center,
                         child: HeaderP(text: 'Woman', color: appcolor.verywhite, fontsize: 15.sp,)),
                     )
                      ],
                    ),
                    )
                  ),
            
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(3,6),
                  blurRadius: 5.0,
                  spreadRadius: 1
              )],
                      image: DecorationImage(image: NetworkImage(Image_man),
                     
                      fit: BoxFit.cover
                      ),
                    ),
                    height: 35.h, width: 105.w,
                    child: InkWell(
                    
                      child: Stack(
                      children: [
                     Container(
                        height: 35.h, width: 105.w,
                       
                       decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(7) ),
                        color: Colors.redAccent.withOpacity(0.4),
                       ),
                       child: Align(
                         alignment: Alignment.center,
                         child: HeaderP(text: 'Man', color: appcolor.verywhite, fontsize: 15.sp,)),
                     )
                      ],
                    ),
                    )
                  ),
            
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                     boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(3,6),
                  blurRadius: 5.0,
                  spreadRadius: 1
              )],
                      image: DecorationImage(image: NetworkImage(Image_kid),
                     
                      fit: BoxFit.cover
                      ),
                      
                    
                    ),
                    height: 35.h, width: 105.w,
                    child: InkWell(
                    
                      child: Stack(
                      children: [
                     Container(
                        height: 35.h, width: 105.w,
                       
                       decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(7) ),
                        color: Colors.lightGreenAccent.withOpacity(0.4),
                        
                       ),
                       child: Align(
                         alignment: Alignment.center,
                         child: HeaderP(text: 'Kids', color: appcolor.verywhite, fontsize: 15.sp,)),
                     ),
                    
                      ],
                    ),
                    )
                  )
                    ],
                  ),
            SizedBox(height:20.h),
             HeaderP(color: appcolor.greyblack, text: 'Products', fontsize: 17.sp),
             Divider(color: Colors.black45,height: 3,),
             SizedBox(height:20.h),
                   ProductDisp(),
                ],
              ),
            ),
          )

      ),
    );
  }
}
