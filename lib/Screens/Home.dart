import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/api_service/profile_service.dart';
import 'package:new_flut/controller/product_controller.dart';
import 'package:new_flut/controller/products.dart';
import 'package:new_flut/models/products.dart';
import 'package:new_flut/models/profile.dart';
import 'package:new_flut/screens/profile_page.dart';
import 'package:new_flut/screens/search_bar.dart';
import 'package:new_flut/style/color/app_color.dart';
import 'package:new_flut/views/product_disp.dart';
import 'package:new_flut/widgets/search_bar.dart';
import 'package:new_flut/widgets/header_p.dart''';
import 'package:shared_preferences/shared_preferences.dart';




class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
bool internetConn=true;
ScrollController _scrollCtrl=ScrollController();
List<String> userId=[];
Data profiledata=Data();

final pControl=Get.put(Pcontroller());
int page=1;
Future<SharedPreferences> _prefs =SharedPreferences.getInstance();
  Future showData()async{
    SharedPreferences prefs=await _prefs;
  setState(() {
    userId=prefs.getStringList('id')!;
  });
    
 // print('it is$userId');
  }
  Future checkInternet() async{
   bool result= await InternetConnectionChecker().hasConnection;
   setState(() {
     internetConn=result;
   });
    print(internetConn);
  
  }

@override
void initState() {
  super.initState();
  checkInternet();
  showData().then((value)async{
    var resp = await ProfileService().getProfile({
      'user_id': userId[0],
      'access_token':userId[1]
    });
 pControl.getProducts(userId[0], userId[1]);
    setState(() {
       profiledata= Data.fromMap(resp["data"]) ;
       print(profiledata.name);
    });
  
  });

  _scrollCtrl.addListener(() {
  
    if(_scrollCtrl.position.pixels==_scrollCtrl.position.maxScrollExtent){
     pControl.isloading.value=true;
      
      page++;
      pControl.getMoreProducts(userId[0], userId[1], page).then((value) => pControl.isloading.value=false);
print("end");
//print("${pControl.product.length}");
    }
      print(_scrollCtrl.position.pixels);
  });
  
  
}
  @override
  Widget build(BuildContext context) {
    
    final String Image_woman='https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?b=1&k=20&m=1294339577&s=170667a&w=0&h=_5-SM0Dmhb1fhRdz64lOUJMy8oic51GB_2_IPlhCCnU=';
    final String Image_man='https://media.istockphoto.com/photos/smiling-indian-man-looking-at-camera-picture-id1270067126?k=20&m=1270067126&s=612x612&w=0&h=ZMo10u07vCX6EWJbVp27c7jnnXM2z-VXLd-4maGePqc=';
    final String Image_kid='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPsto0hEV_Zr-fKwxWODIAqe5YZvj82TS_Qg&usqp=CAU';
    final appcolor=Appcolor();
     String interMessage='No internet connection, Please connect your phone to internet and restart the app';



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70.withOpacity(0.975),
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 253.h,
          flexibleSpace: SafeArea(child: Container(
            decoration: BoxDecoration(color: Colors.white70.withOpacity(0.975),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Column(children: [
             Row(
                    children: [
                      Builder(
                        builder: (context) {
                          return IconButton(onPressed: () => Scaffold.of(context).openDrawer(),
                              icon: Icon(CupertinoIcons.circle_grid_3x3_fill,size: 25.sp,color: Colors.black54,));
                        }
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 190.w),
                        child: IconButton(onPressed: (){},
                            icon: Icon(Icons.notifications_none_sharp,color: Colors.black54)),
                      ),
                      IconButton(onPressed: ()=>showSearch(context: context, delegate: CustomSearchDelegate()),
                          icon: const Icon(CupertinoIcons.search,color: Colors.black54,)),
                        
                    ],
                  ),
                   SizedBox(height:3.h),
                   Searchbar(),
                   SizedBox(height:20.h),
                  HeaderP(color: appcolor.greyblack, text: "Categories", fontsize: 20.sp,),
                  SizedBox(height:20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(3,6),
                  blurRadius: 5.0,
                  spreadRadius: 1
              )],
                      image: DecorationImage(image: NetworkImage(Image_woman),        fit: BoxFit.cover   ),
                      
                    
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
            ]),
          )),
          ) ,
          drawer: drawer(context),
        backgroundColor: Colors.white70.withOpacity(0.975),
          body: internetConn?
          ProductDispp():Center(
            child: Container(
                      
                      height: 50.h,width: 250.w,
                      color: appcolor.tint_grey.withOpacity(0.7),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: HeaderP(color: appcolor.verywhite, text: interMessage, fontsize: 12.sp),
                      ),
                    ),
          )

      ),
    );
  }

  drawer(BuildContext context) {

    final appcolor=Appcolor();
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 150.h, width: double.infinity,
            
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(50),topRight:Radius.circular(50) ),
             color: appcolor.dark_grey,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100.h,width: 100.w,
                  decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                   image:  DecorationImage(image: AssetImage('assets/images/avatar.png'),fit: BoxFit.fill)
                  ),
                ),
               
                HeaderP(color: appcolor.tint_grey, text: profiledata.email.toString(), fontsize: 12.sp),
                SizedBox(height: 5.h,),
                HeaderP(color: appcolor.tint_grey, text: profiledata.mobile.toString(), fontsize: 12.sp),
              ],
            ),
          ),
           SizedBox(height: 12.h,),
          InkWell(
            onTap: ()=>Get.to(()=>ProfilePage()),
            child: Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Image.asset('assets/images/profile.png',height:40.h,width: 40.w,),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: HeaderP(color: appcolor.grey, text: 'My Profile', fontsize: 14.sp),
                )
              ]),
            ),
          ),
          SizedBox(height: 10.h,),
          InkWell(
            onTap: (){},
            child: Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/cart.png',height:40.h,width: 40.w,),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: HeaderP(color: appcolor.grey, text: 'Cart', fontsize: 14.sp),
                )
              ]),
            ),
          ),
          SizedBox(height: 10.h,),
          InkWell(
            onTap: (){},
            child: Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Image.asset('assets/images/order.png',height:40.h,width: 40.w,),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: HeaderP(color: appcolor.grey, text: 'My Orders', fontsize: 14.sp),
                )
              ]),
            ),
          ),
          Divider(),
          SizedBox(height: 10.h,),
          InkWell(
            onTap: (){},
            child: Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Icon(Icons.settings,color: appcolor.blue,size: 30.sp,),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: HeaderP(color: appcolor.grey, text: 'Settings', fontsize: 14.sp),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

ProductDispp(){
return  Obx(()=>Stack(
  children: [
        GridView.builder(
    
                  controller: _scrollCtrl,
    
                 scrollDirection: Axis.vertical,
    
                   shrinkWrap: true,
    
                        itemCount: pControl.product.length,
    
                        physics:const  ScrollPhysics(),
    
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
    
                        crossAxisSpacing: 10,
    
                          mainAxisSpacing: 10,
    
                         childAspectRatio: 3/2,
    
                          mainAxisExtent: 245,
    
                        ), 
    
                        itemBuilder: (BuildContext context, int index) {
    
                          //return ListTile(title: Text("milk"),);
    
                          return  ProductData( pDetails: Datum.fromMap(pControl.product[index]),);
    
                        },
    
                      ),
                      if(pControl.isloading.value)...[
                        Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 41.h,
                          child: CircularProgressIndicator(),
                        )
                        )
  ]
  ],
));
}
}
