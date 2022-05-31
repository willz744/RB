import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'home'),
      );
  },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 50.h,left: 85.5),
              child: Text(
                'Welcome to RBuy',
                style: GoogleFonts.varelaRound(
                  fontWeight: FontWeight.w700,
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  )
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 110.w),
              child: Text(
                'Explore Us',
                style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w500,
                    textStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 17,
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 80.h,horizontal: 20.w),
              child: Image.asset(
                'assets/images/home.png',
               height: 230.h,
                width: 260.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w,right: 35.w),
              child: Container(
                height: 44.0,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: ElevatedButton(
                  onPressed: () => Get.to(Login()),
                  style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 80.w),
                    child: Text('Log in',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w300
                      )
                    ),


                    ),
                  ),
                ),
              )
            ),
            SizedBox(height: 12.h),
            TextButton(onPressed: (){},
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 120.w),
                  child: Text('Signup',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ),
                ),)
          ],
        ),
      ),
    );
  }
}
