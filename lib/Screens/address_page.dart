import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/screens/payment_page.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/widgets/header_p.dart';
import 'package:new_flut/widgets/text_button.dart';



class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {


  @override
  Widget build(BuildContext context) {
    var appcolor=Appcolor();
    final cartCtrl=Get.find<CartController>();
  Color boxcolor=appcolor.black;
    List address=['No 9 eltabera estate barracks nsukka', 'Goshen enugu premiar layout','ariport raod ikeja lagos'];
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.white70.withOpacity(0.975),
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 50.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: Colors.white70.withOpacity(0.975),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      IconButton(onPressed: ()=>Get.back(),
                          icon: Icon(Icons.arrow_back_outlined,size: 18.sp,color: Colors.black54,)),
                      
                       
                        
                    ],
                  ),
                   SizedBox(height:3.h),
                   
            ]),
          )),
          ) ,
               body:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding:  EdgeInsets.only(top: 10.h,left: 10.w,bottom: 20.h),
                     child: HeaderP(color: appcolor.greyblack, text: 'Address', fontsize: 20.sp),
                   ),

                  
               Container(
                 height: 300.h,
                 child: Expanded(
                   child: ListView.builder(
                      itemCount: address.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          
                          elevation: 5,
                          
                          child: ListTile(
                            //selectedColor: boxcolor,
                            //selected: true,
                            onTap: (){
                            setState(() {
                              boxcolor=appcolor.blue;
                            });
                   
                            },
                            
                    leading: const Icon(Icons.home_work_outlined, ),
                   
                    subtitle: Text(" ${address[index]}"),
                    title: Text(
                            "address ${index}",
                            style: TextStyle(color: boxcolor, fontSize: 15),
                      ),
                    
                    ),
                    
                        ),
                      );
                           } ),
                 ),
               ),
   
   
   Padding(
        padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 130.h),
        child: Container(
          height: 44.0,
          decoration:  BoxDecoration(
            border:  Border.all(style: BorderStyle.solid,
            color: appcolor.blue
            ),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: ElevatedButton(
            onPressed: () {
              
            },
            style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 100.w),
              child: Text('Add Address',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: appcolor.blue,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300
                    )
                ),


              ),
            ),
          ),
        )
    ),

    Padding(
        padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
        child: Expanded(
          child: Container(
            height: 44.0,
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                
            ),
            child:  ElevatedButton(
                onPressed: () {
                 Get.to(PaymentPage());
                 cartCtrl.totalAmount();
                },
                style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 70.w),
                  child: Text('Continue To Payment',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: appcolor.verywhite,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400
                        )
                    ),
            
            
                  ),
                ),
              ),
            
          ),
        )
    ),
                 ],
               )
               
               
    );
  }
}