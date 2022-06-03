import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Passfield extends StatelessWidget {

  const Passfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: Colors.black38,
      style: TextStyle(color: Colors.black54),
      decoration: InputDecoration(
          prefixIcon:  Icon(Icons.lock_open,color: Colors.black38,),
          suffixIcon: Icon(Icons.visibility,color: Colors.black38,),

          labelText: 'Password',
          labelStyle: TextStyle(
              color: Colors.black38
          ),
          focusedBorder: OutlineInputBorder(

              borderSide: BorderSide(
                  color: Colors.black38
              )
          )
      ),
      obscureText: true,
    );
  }
}
