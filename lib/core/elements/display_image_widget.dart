import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_images.dart';

Widget displayImageWidget({
  required String imagePath,
  required VoidCallback onTap
  }) {
  return Stack(
    children: [
      SizedBox(
          height: 230.h,
          width: Get.width,
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
          )
      ),
      Positioned(
        top: 30.h,
        left: 10.w,
        child: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Image.asset(
            AppImages.arrowLeft,
            height: 22.h,
          ),
        ),
      ),
      Positioned(
          right: 5.w,
          bottom: 5.h,
          child: GestureDetector(
            onTap: (){
              onTap();
            },
            child: Container(
              height: 25.h,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  shape: BoxShape.circle
              ),
              child: Image.asset(
                AppImages.editImageIcon,
              ),
            ),
          )
      )
    ],
  );
}