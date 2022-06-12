import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/Screens/Login.dart';
import 'package:new_flut/controller/cart_controller.dart';
import 'package:new_flut/controller/shopping_controller.dart';

import '../models/products.dart';

class ProductDisp extends StatefulWidget {
  const ProductDisp({Key? key}) : super(key: key);

  @override
  State<ProductDisp> createState() => _ProductDispState();
}

class _ProductDispState extends State<ProductDisp> {
  
  final productlist=[
    {
   "name" : "women kids Shirt",
   "image": "https://ae01.alicdn.com/kf/H1efccb1984b849b8bfa7bea098b1de258/Mother-Kids-Fashion-Baby-Girl-Clothes-Mom-Life-Mother-And-Daughter-Matching-Outfits-Summer-Mother-And.jpg_Q90.jpg_.webp",
   "description":"Mother Kids Fashion Baby Girl Clothes Mom Life Mother And Daughter Matching Outfits Summer Mother And Kids T Shirt Short Sleeve",
   "price": 50
    },
    {
   "name" : "Organic Cotton Baby Pants Newborn ",
   "image": "https://ae01.alicdn.com/kf/Hdff1cf8510e64e76990dcdda8f8ebe36q/Organic-Cotton-Baby-Pants-Newborn-Toddlers-Autumn-Spring-Summer-Winter-Cute-Print-Soft-Muslin-Clothes-Pants.jpg_Q90.jpg_.webp",
   "description":"Mother Kids Fashion Baby Girl Clothes Mom Life Mother And Daughter Matching Outfits Summer Mother And Kids T Shirt Short Sleeve",
   "price": 30
    },
    {
   "name" : "Plus Size 5XL Casual V-neck Lace Short ",
   "image": "https://ae01.alicdn.com/kf/H8f69d88dc08e478db7c3dbc98347cf4fc/Plus-Size-5XL-Casual-V-neck-Lace-Short-Sleeve-T-shirt-for-Women-Spring-Winter-Clothes.jpg_Q90.jpg_.webp",
   "description":"Mother Kids Fashion Baby Girl Clothes Mom Life Mother And Daughter Matching Outfits Summer Mother And Kids T Shirt Short Sleeve",
   "price": 28
    },
    {
   "name" : "2022 Men's Jacket Fashion Spring",
   "image": "https://ae01.alicdn.com/kf/S3d1994be6d9a4d85bf93444e55cd3b7fx/2022-Men-s-Jacket-Fashion-Spring-Autum-Casual-Streetwear-Hoodie-Jacket-Men-Waterproof-Clothes-Mens-Windbreaker.jpg_Q90.jpg_.webp",
   "description":"Mother Kids Fashion Baby Girl Clothes Mom Life Mother And Daughter Matching Outfits Summer Mother And Kids T Shirt Short Sleeve",
   "price": 37
    },
     {
   "name" : "T shirt Men disney mickey mouse women",
   "image": "https://ae01.alicdn.com/kf/S6ef9e0e57a1a4b3c8655f4bed9b9fdcdy/T-shirt-Men-disney-mickey-mouse-women-Tshirts-Cute-Cartoon-Fashion-Top-Tee-Shirt-Clothes-Female.jpg_Q90.jpg_.webp",
   "description":"Mother Kids Fashion Baby Girl Clothes Mom Life Mother And Daughter Matching Outfits Summer Mother And Kids T Shirt Short Sleeve",
   "price": 68
    },
     {
   "name" : "amily Set Butterflies Mother Daughter Matching Dresses  ",
   "image": "https://ae01.alicdn.com/kf/Sf7eb95bbcf5048b98d1a3c457792acc24/Family-Set-Butterflies-Mother-Daughter-Matching-Dresses-Tank-Mom-Mum-Baby-Mommy-and-Me-Clothes-Outfits.jpg_Q90.jpg_.webp",
   "description":"Mother Kids Fashion Baby Girl Clothes Mom Life Mother And Daughter Matching Outfits Summer Mother And Kids T Shirt Short Sleeve",
   "price": 54
    },
     {
   "name" : "Infant Cotton Kids Clothes Girls ",
   "image": "https://ae01.alicdn.com/kf/H5548bc231b05473da88294bdc2ae9c2bD/Infant-Cotton-Kids-Clothes-Girls-For-Newborn-Baby-2020-Summer-Baby-Outfit-With-Matched-Cap-Set.jpg_Q90.jpg_.webp",
   "description":"Mother Kids Fashion Baby Girl Clothes Mom Life Mother And Daughter Matching Outfits Summer Mother And Kids T Shirt Short Sleeve",
   "price": 70
    },
  ];
final shopcontrol=Get.put(ShoppingController());


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: 
      GridView.builder(
             scrollDirection: Axis.vertical,
               shrinkWrap: true,
                    itemCount: productlist.length,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    // childAspectRatio: 2,
                      mainAxisExtent: 230,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Productdata(price: double.parse(productlist[index]['price'].toString()) , 
                      productDescription: productlist[index]['description'], 
                      productImage: productlist[index]['image'], 
                      productName: productlist[index]['name'],);
                    },
                  ),
    );
    
    
  }
}