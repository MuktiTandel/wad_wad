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
    this.backgroundColor,
    this.isHome = false,
    this.width,
    this.fontSize,
    this.isSelect = false
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonText;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final bool? isHome;
  final double? fontSize;
  final bool? isSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 10)),
              padding: EdgeInsets.zero,
              elevation: 0
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: isHome == true
                        ? isSelect == true
                        ? [AppColors.lightOrange, AppColors.darkOrange]
                        : [AppColors.gray1, AppColors.gray1]
                        : [AppColors.darkOrange, AppColors.lightOrange],
                  begin: isHome == true ? Alignment.topCenter : Alignment.centerLeft,
                  end: isHome == true ? Alignment.bottomCenter : Alignment.centerRight,
                ),
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
                        fontSize: fontSize ?? 13.sp,
                      fontFamily: "Poppins"
                    ),
                  ),
                ),
              ),
            ))
    );
  }
}