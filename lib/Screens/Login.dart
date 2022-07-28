import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Home.dart';
import 'package:new_flut/api_service/api_service.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/pass_field.dart';
import 'package:new_flut/widgets/text_field.dart';

import '../widgets/text_button.dart';
import 'signup.dart';


class Login extends StatefulWidget {
  
  
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
final _formKey = GlobalKey<FormState>();
final appcolor=Appcolor();
//bool isloading=true;
Future signIn()async{
 
  if(_formKey.currentState!.validate()){
    bool isloading=true;
   isloading?showDialog(builder: (BuildContext context) { 
      return Center(
        child: SpinKitCubeGrid(
          size: 50.sp,
          color: appcolor.white_tint,
          duration: const Duration(seconds: 2),
        ),
      );
     }, context: context):Container();

    ApiService().signIn({
    'account': email.text,
        'password': password.text,
        'device_type': 'android',
        'device_token':'1234',
        'login_by': 'manual',

    }).then((value) {
  setState(() {
    isloading=false;
  });
  
    });
  }
}
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
              Text('Login',
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
              child: Column(
              children: [
                  TextFormField(
                 cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      decoration: InputDecoration(
        
          prefixIcon:  Icon(Icons.person,color: appcolor.grey,),
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
        else return "Enter a email";
      } ,
              ),
      SizedBox(height:40.h),
              TextFormField(
                 cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon:  Icon(Icons.person,color: appcolor.grey,),
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
      validator: (val){
        if(val!="") return null;
        else return "Enter a password";
      } ,
              ),
                ],)),
             
          
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
             signIn();
             print('pressed');
            },
            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 80.w),
              child: Text('Login',
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
                    child: Text("Don't have an account ?",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                          )
                      ),
                    ),
                  ),
                  TextButton(onPressed: ()=> Get.to(Signup()),
                      child: const Text('Sign Up', style: TextStyle(color: Colors.black54),)
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
