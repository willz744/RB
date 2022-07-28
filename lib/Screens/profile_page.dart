import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/api_service/profile_service.dart';
import 'package:new_flut/models/profile.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Data profiledata=Data();
  List<String> userId=[];
Future<SharedPreferences> _prefs =SharedPreferences.getInstance();
  Future showData()async{
    SharedPreferences prefs=await _prefs;
  setState(() {
    userId=prefs.getStringList('id')!;
  });
    
 // print('it is$userId');
  }
@override void initState() {
    showData().then((value)async{
    var resp = await ProfileService().getProfile({
      'user_id': userId[0],
      'access_token':userId[1]
    });
    setState(() {
       profiledata= Data.fromMap(resp["data"]) ;
       print(profiledata.name);
    });
   
  });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final appcolor=Appcolor();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(242,242,242,242),
    appBar: AppBar(
          backgroundColor: appcolor.white_tint,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 50.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: appcolor.white_tint,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      IconButton(onPressed: ()=>Get.back(),
                          icon: Icon(Icons.arrow_back_outlined,size: 20.sp,color: appcolor.tint_grey,)),      
                    Padding(
                      padding:  EdgeInsets.only(left: 100.w),
                      child: HeaderP(color: appcolor.tint_grey, text: 'Profile', fontsize: 15.sp),
                    )
                    ],
                  ),
                   SizedBox(height:3.h),
                   
            ]),
          )),
          ) ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100.h,width: double.infinity,
              color: appcolor.white_tint,
              child:Column(
                children: [
                  rowData('Photo', 13.sp,Image.asset('assets/images/avatar.png',height: 60.h,width: 60.w,)),
                  Divider(height: 2.h,),
                  SizedBox(height: 5.h,),
                  rowData('Member Center', 13.sp,Text('Platinium member',style: TextStyle(color: appcolor.grey),)),
                ],
              ),
            ),
            SizedBox(height: 8.h,),
             Container(
              height: 124.h,width: double.infinity,
              color: appcolor.white_tint,
              child:Column(
                children: [
                  SizedBox(height: 8.h,),
                  rowData('Account Info', 13.sp,Text('Platinium member',style: TextStyle(color: appcolor.grey))),
                  SizedBox(height: 8.h,),
                  Divider(height: 2.h,),
                   SizedBox(height: 8.h,),
                  rowData('Name', 13.sp,Text(profiledata.name.toString(),style: TextStyle(color: appcolor.grey))),
                   SizedBox(height: 8.h,),
                    Divider(height: 2.h,),
                     SizedBox(height: 8.h,),
                  rowData('Gender', 13.sp,Text('',style: TextStyle(color: appcolor.grey))),
                   SizedBox(height: 8.h,),
                    
                    
                ],
              ),
            ),
            SizedBox(height: 8.h,),
             Container(
                     height: 42.h,width: double.infinity,
                      color: appcolor.white_tint,
                      child:Column(
                      children: [
                         SizedBox(height: 8.h,),
                      rowData('Shipping Address', 13.sp,Text('',style: TextStyle(color: appcolor.grey))),
                      
                       
                ],
              ),
            ),
           
              
          ],
        ),
      ),
    );
  }

  Widget rowData(String text,double fontsize, Widget wig) {
    final appcolor=Appcolor();
    return Padding(
      padding:  EdgeInsets.only(left: 10.w,right: 10.w),
      child: Row(
        children: [
          Text(text,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: appcolor.black,
                        fontSize: fontsize,
                        fontWeight: FontWeight.w400
                    )
                ),
              ),
              
                Spacer(),
                wig,
                Icon( CupertinoIcons.chevron_forward,size: 19.sp,color: appcolor.tint_grey,),
              
        ],
      ),
    );
  }
}
