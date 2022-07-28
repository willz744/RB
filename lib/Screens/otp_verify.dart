import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Home.dart';
import 'package:new_flut/api_service/otp_service.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/screens/checkout_page.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:new_flut/widgets/text_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';



class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  String pin="";
  String pin_check="123456";
 var appcolor=Appcolor();

 List<String> userId=[];
Future<SharedPreferences> _prefs =SharedPreferences.getInstance();
  Future showData()async{
    SharedPreferences prefs=await _prefs;
  setState(() {
    userId=prefs.getStringList('id')!;
  });
  }
  @override 
  void initState(){
    super.initState();
    showData();
    print(userId);
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
            
                   SizedBox(height:3.h),
                   
            ]),
          )),
          ) ,
               body:  Padding(
                 padding:  EdgeInsets.only(left: 20.w),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding:  EdgeInsets.only(top: 10.h,left: 50.w,right: 50.w),
                       child: HeaderP(color: appcolor.black, text: 'OTP Verification', fontsize: 25.sp),
                     ),

                  
                 Divider(),
                SizedBox(height: 50.h,),
                Padding(
                       padding:  EdgeInsets.only(top: 10.h,left: 70.w,right: 50.w),
                       child: HeaderP(color: appcolor.grey, text: 'Enter otp code', fontsize: 20.sp),
                     ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                        vertical: 8.w, horizontal: 30.h),
                  child: PinCodeTextField(
                    appContext: context,
                     pastedTextStyle: TextStyle(
                          color: appcolor.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6, 
                        onChanged: (String value) { 
                           setState(() {
                             pin=value;
                           });
                         },
                          
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                     // enableActiveFill: true,
                      keyboardType: TextInputType.number,
                     
                    ),
                ),
       
               SizedBox(height: 80.h,),
              button(),
    
                   ],
                 ),
               )
               
               
    );
  }
  Widget button ()=> Padding(
        padding: EdgeInsets.only(left: 35.w,right: 35.w),
        child: Container(
          height: 44.0,
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: ElevatedButton(
            onPressed: () {
             OtpService().verifyOtp(pin, userId[0], userId[1]);
            },
            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80.w),
              child: Text('Verify',
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