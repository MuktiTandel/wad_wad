import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    this.height,
    this.borderRadius,
    this.backgroundColor
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonText;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 10)),
              padding: EdgeInsets.zero,
              elevation: 0
            ),
            child: Ink(
              decoration:  BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.darkOrange, AppColors.lightOrange]),
                borderRadius: BorderRadius.circular(borderRadius ?? 10)
              ),
              child: SizedBox(
                height: height ?? 50,
                width: Get.width,
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      fontFamily: "Poppins"
                    ),
                  ),
                ),
              ),
            ))
    );
  }
}