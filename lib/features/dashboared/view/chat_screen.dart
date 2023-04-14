import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/custom_textfield.dart';
import 'package:wad_wad/features/dashboared/controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);

   final controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
              text: AppStrings.chat,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 40.h,
            child: CustomTextField(
              controller: controller.searchController,
              textAlignVertical: TextAlignVertical.bottom,
              borderRadius: 10,
              prefixWidget: Padding(
                padding: const EdgeInsets.all(14),
                child: Image.asset(
                  AppImages.search,
                  color: AppColors.gray,
                  height: 10.h,
                  width: 10.w,
                ),
              ),
              hintText: AppStrings.search,
              onchange: (val){},
            )
          ),
          Expanded(child: SizedBox(height: 10.h,)),
          Center(
            child: Image.asset(
              AppImages.dog5,
              height: 150.h,
              width: 150.w,
              color: AppColors.lightGray,
            ),
          ),
          Expanded(child: SizedBox(height: 10.h,))
        ],
      ),
    );
  }
}
