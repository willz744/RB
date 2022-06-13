import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderP extends StatelessWidget {
  final Color color;
  final String text;
  final double fontsize;
  const HeaderP({Key? key, required this.color, required this.text, required this.fontsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    //overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: color,
                        fontSize: fontsize,
                        fontWeight: FontWeight.w600
                    )
                ),
              );
    
  }
}