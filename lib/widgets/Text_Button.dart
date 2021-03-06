import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/utils/page_r.dart';

class  Textbutton extends StatelessWidget {
  final String text;
  final String pageR;
   String ?account="";
   String ?password;
   Textbutton({Key? key, required this.text, required this.pageR,this.account,this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router=PageR(pager: pageR,account: account,password: password);
    final appcolor=Appcolor();
    return  Padding(
        padding: EdgeInsets.only(left: 35.w,right: 35.w),
        child: Container(
          height: 44.0,
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: ElevatedButton(
            onPressed: () {
              router.route();
            },
            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80.w),
              child: Text(text,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: appcolor.verywhite,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w300
                    )
                ),


              ),
            ),
          ),
        )
    );
  }
}
