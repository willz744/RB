import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flut/style/color/App_color.dart';

class Textfield extends StatelessWidget {
  final IconData icon;
  final String labeltxt;
  const Textfield({Key? key, required this.icon, required this.labeltxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appcolor=Appcolor();
    return  TextField(
      cursorColor: appcolor.grey,
      style: TextStyle(color: appcolor.greyblack),
      decoration: InputDecoration(
        //   prefixIconColor: Colors.black38,
          prefixIcon:  Icon(icon,color: appcolor.grey,),
          labelText: labeltxt,
          labelStyle: TextStyle(
              color: appcolor.grey
          ),
          focusedBorder: OutlineInputBorder(

              borderSide: BorderSide(
                  color: appcolor.grey
              )
          )
      ),
    );
  }
}
