import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/elements/scroll_behavior.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/features/dashboared/controller/dashboared_controller.dart';
import 'package:wad_wad/features/dashboared/view/chat_screen.dart';
import 'package:wad_wad/features/dashboared/view/explore_screen.dart';
import 'package:wad_wad/features/dashboared/view/like_screen.dart';
import 'package:wad_wad/features/dashboared/view/setting_screen.dart';

class DashBoredScreen extends StatefulWidget {
  const DashBoredScreen({Key? key}) : super(key: key);

  @override
  State<DashBoredScreen> createState() => _DashBoredScreenState();
}

class _DashBoredScreenState extends State<DashBoredScreen> {

  final controller = Get.put(DashBoredController());

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h,),
          Padding(
            padding:  EdgeInsets.only(left: 13.w, right: 13.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 60.h,
                  width: 90.w,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppPages.NOTIFICATION);
                  },
                  child: Image.asset(
                      AppImages.notification,
                    height: 22.h,
                    width: 22.w,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() => IndexedStack(
              index: controller.pageIndex.value,
              children:  [
                ExploreScreen(),
                ChatScreen(),
                LikeScreen(),
                SettingScreen()
              ],
            )),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: GestureDetector(
          onTap: (){},
          child: Container(
            height: 60.h,
            width: 60.w,
            padding: EdgeInsets.all(2.w),
            decoration:  const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [ AppColors.lightOrange, AppColors.orange ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.dog3))
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          color: Colors.white,
          child: SizedBox(
            height: 80.h,
            child: Container(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => bottomBarWidget(
                      image: controller.pageIndex.value == 0
                          ? AppImages.explore1
                          : AppImages.explore, index: 0),),
                  SizedBox(width: 10.w,),
                  Obx(() => bottomBarWidget(
                      image: controller.pageIndex.value == 1
                          ? AppImages.message1
                          : AppImages.message, index: 1 )),
                  SizedBox(width: 60.w,),
                  Obx(() => bottomBarWidget(
                      image: controller.pageIndex.value == 2
                          ? AppImages.like1
                          : AppImages.like, index: 2)),
                  SizedBox(width: 10.w,),
                  Obx(() => bottomBarWidget(
                      image: controller.pageIndex.value == 3
                          ? AppImages.setting
                          : AppImages.setting1, index: 3),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomBarWidget({ required String image,required int index}) {
    return GestureDetector(
      onTap: (){
        controller.changePageIndex(index);
      },
      child: Image.asset(
        image,
        height: 25.h,
        width: 28.w,
      ),
    );
  }
}
