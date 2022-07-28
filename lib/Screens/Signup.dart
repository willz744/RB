import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/api_service/api_service.dart';
import 'package:new_flut/screens/otp_verify.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/pass_field.dart';
import 'package:new_flut/widgets/text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/text_field.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String device_type="";
ScrollController scrollCtrl=ScrollController();
  @override
  void initState(){
    super.initState();
    if(Platform.isIOS) {device_type='ios';} 
    else if(Platform.isAndroid){device_type='android';}
    print(device_type);
  }

  @override
  Widget build(BuildContext context) {

TextEditingController name=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController mobile=TextEditingController();
TextEditingController password=TextEditingController();
TextEditingController pass_confirm=TextEditingController();

final _formKey = GlobalKey<FormState>();
ApiService apiService=ApiService();
List<String> myl=[];
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future saveId(String userId,String accessToken)async{
 SharedPreferences prefs =  await _prefs;
prefs.setStringList('id', ['$userId','$accessToken']);
}
Future printId()async{
 SharedPreferences prefs =  await _prefs;
 myl=prefs.getStringList('id')!;
print(myl);
}
Future signUp()async{
 saveId('my own', 'mimi').then((value) => print('success'));
//printId();
  if(_formKey.currentState!.validate()){
    apiService.signUp({
     'name': name.text.toString(),
     'email': email.text,
     'mobile': mobile.text,
     'password':password.text,
     'password_confirmation':pass_confirm.text,
     'device_type': device_type,
     'login_by': 'manual',
     'device_token':'1234'

    });
  }
}
    var appcolor=Appcolor();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: ()=>Get.back(),
                icon: Icon(Icons.arrow_back_outlined,color: Colors.black38,

                ),
              ),
              SizedBox(height:20.h),
              Text('Signup',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600
                    )
                ),
              ),
              SizedBox(height:40.h),
              Form(
                key: _formKey,
                child: 
              Column(
  children: [
        TextFormField(
                 cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      decoration: InputDecoration(
        
          prefixIcon:  Icon(Icons.person,color: appcolor.grey,),
          labelText: 'Name',
          labelStyle: TextStyle(
              color: appcolor.grey
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: appcolor.grey
              )
          )
      ),
      controller: name,
      validator: (val){
        if(val!="") return null;
        else return "Enter a name";
      } ,
              ),
  SizedBox(height:40.h),

      TextFormField(
                 cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      decoration: InputDecoration(
        
          prefixIcon:  Icon(Icons.email_outlined,color: appcolor.grey,),
          labelText: 'Email',
          labelStyle: TextStyle(
              color: appcolor.grey
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: appcolor.grey
              )
          )
      ),
      controller: email,
      validator: (val){
        if(val!="") return null;
        else return "Enter email";
      } ,
              ),
  SizedBox(height:40.h),

      TextFormField(
                 cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      decoration: InputDecoration(
        
          prefixIcon:  Icon(Icons.phone_android_outlined,color: appcolor.grey,),
          labelText: 'Phone No',
          labelStyle: TextStyle(
              color: appcolor.grey
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: appcolor.grey
              )
          )
      ),
      controller: mobile,
      validator: (val){
        if(val!=""&& val.toString().length>9) return null;
        else return "Enter correct mobile format";
      } ,
              ),

              SizedBox(height:40.h),

      TextFormField(
                 cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      decoration: InputDecoration(
        
          prefixIcon:  Icon(Icons.lock,color: appcolor.grey,),
          labelText: 'Password',
          labelStyle: TextStyle(
              color: appcolor.grey
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: appcolor.grey
              )
          )
      ),
      controller: password,
      obscureText: true,
      validator: (val){
        if(val!="" && val.toString().length>=6) return null;
        else return "Enter password";
      } ,
              ),

              SizedBox(height:40.h),

      TextFormField(
                 cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      decoration: InputDecoration(
        
          prefixIcon:  Icon(Icons.lock_clock_outlined,color: appcolor.grey,),
          labelText: 'Confirm password',
          labelStyle: TextStyle(
              color: appcolor.grey
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: appcolor.grey
              )
          )
      ),
      obscureText: true,
      controller: pass_confirm,
      validator: (val){
        if(val!="" && password.text==pass_confirm.text) return null;
        else return "Passwords doesnt match";
      } ,
              ),
             
             
             ],
              )),
              
            
          
              SizedBox(height:50.h),

              Padding(
        padding: EdgeInsets.only(left: 35.w,right: 35.w),
        child: Container(
          height: 44.0,
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: ElevatedButton(
            onPressed: () {
             signUp();
             print('pressed');
            },
            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80.w),
              child: Text('Sign Up',
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
    ),
              SizedBox(height:20.h),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w),
                    child: Text("Already have an account ?",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                  ),
                  TextButton(onPressed: ()=> Get.to(Login()),
                      child: Text('Sign in', style: TextStyle(color: Colors.black54),)
                  )
                ],
              ),
            ],

          ),
        ),
      ),
    );



  }
}
