import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/screens/search_bar.dart';
import 'package:new_flut/style/color/app_color.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final appcolor =Appcolor();
    return Padding(
      padding:  EdgeInsets.only(left: 10.w),
      child: Container(
        height: 40.h,
        width: 300.w,
        decoration: BoxDecoration(
            color: appcolor.verywhite,
            border: Border.all(color: appcolor.verywhite),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(5,10),
                blurRadius: 8.0,
                spreadRadius: 4
            )]
        ),


        child: TextField(
          onTap: (() => showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
          
        )),
          cursorColor: appcolor.greyblack,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.black54,),
              hintText: 'Search Your Product',
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                // borderSide: BorderSide.lerp(2.0, b, t)
              )
          ),
        ),
      ),
    );
  }
}


