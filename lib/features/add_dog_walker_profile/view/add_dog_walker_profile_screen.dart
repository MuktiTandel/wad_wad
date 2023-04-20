import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_images.dart';
import 'package:wad_wad/core/const/app_strings.dart';
import 'package:wad_wad/core/elements/custom_button.dart';
import 'package:wad_wad/core/elements/custom_text.dart';
import 'package:wad_wad/core/elements/custom_textfield.dart';
import 'package:wad_wad/core/elements/display_image_widget.dart';
import 'package:wad_wad/core/elements/scroll_behavior.dart';
import 'package:wad_wad/core/elements/select_image_widget.dart';
import 'package:wad_wad/core/elements/select_widget.dart';
import 'package:wad_wad/core/routes/app_pages.dart';
import 'package:wad_wad/features/add_dog_walker_profile/controller/add_dog_walker_profile_controller.dart';

class AddDogWalkerProfileScreen extends StatefulWidget {
   const AddDogWalkerProfileScreen({Key? key}) : super(key: key);

  @override
  State<AddDogWalkerProfileScreen> createState() => _AddDogWalkerProfileScreenState();
}

class _AddDogWalkerProfileScreenState extends State<AddDogWalkerProfileScreen> {

   final controller = Get.put(AddDogWalkerProfileController());

   Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.imagePath == null ? AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding:  EdgeInsets.all(12.w),
          child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child:
              Image.asset(
                AppImages.arrowLeft,
              )
          ),
        ),
        title: CustomText(
          text: AppStrings.aDWProfile,
          color: Colors.black,
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
        ),
      ) : null,
      body: ScrollConfiguration(
          behavior: AppBehavior(),
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  controller.imagePath == null ? selectImageWidget(
                      onTap: (){
                    controller.pickImage(false).then((value) {
                      setState(() {
                        if (controller.imagePath != null
                            && controller.nameController.text.isNotEmpty
                            && controller.ageController.text.isNotEmpty
                            && controller.aboutYourselfController.text.isNotEmpty
                            && controller.idImage != null ) {
                          controller.isEnable.value = true;
                        }
                      });
                    });
                  },
                    title: AppStrings.uImage,
                    subTitle: AppStrings.iHere
                  ) : displayImageWidget(
                      imagePath: controller.imagePath!.path,
                      onTap: (){
                        controller.pickImage(false).then((value) {
                          setState(() {
                            if (controller.imagePath != null
                                && controller.nameController.text.isNotEmpty
                                && controller.ageController.text.isNotEmpty
                                && controller.aboutYourselfController.text.isNotEmpty
                                && controller.idImage != null ) {
                              controller.isEnable.value = true;
                            }
                          });
                        });
                      }
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                     Padding(
                       padding: EdgeInsets.only(left: 12.w, right: 12.w),
                       child: Column(
                         children: [
                           Obx(() => CustomTextField(
                             controller: controller.nameController,
                             hintText: AppStrings.eYName,
                             labelPadding: controller.isName.value == true
                                 ? EdgeInsets.only(top: 30.h)
                                 : EdgeInsets.zero,
                             isType: controller.nameType.value,
                             onchange: (val) {
                               if ( val.isNotEmpty ) {
                                 controller.nameType.value = true;
                                 controller.isName.value = true;
                                 if (  controller.ageController.text.isNotEmpty
                                     && controller.aboutYourselfController.text.isNotEmpty
                                     && controller.imagePath != null
                                     && controller.idImage != null ) {
                                   controller.isEnable.value = true;
                                 }
                               }
                               if ( val.isEmpty ) {
                                 if ( controller.nameType.value == true ) {
                                   controller.nameType.value = false;
                                 }
                               }
                             },
                           )),
                           SizedBox(
                             height: 20.h,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Obx(() => selectWidget(
                                   onTap: (){
                                     if ( controller.isLocation.value == true ) {
                                       controller.isLocation.value = false;
                                     }
                                     if ( controller.isReviews.value == true ) {
                                       controller.isReviews.value = false;
                                     }
                                     if ( controller.isAbout.value == false ) {
                                       controller.isAbout.value = true;
                                     }
                                   },
                                   title: AppStrings.about,
                                   backgroundColor: controller.isAbout.value == false
                                       ? AppColors.lightGray.withOpacity(0.5)
                                       : Colors.black,
                                   textColor: controller.isAbout.value == false
                                       ? AppColors.gray
                                       : Colors.white
                               ),),
                               Obx(() =>  selectWidget(
                                   onTap: (){
                                     if ( controller.isLocation.value == false ) {
                                       controller.isLocation.value = true;
                                     }
                                     if ( controller.isAbout.value == true ) {
                                       controller.isAbout.value = false;
                                     }
                                     if ( controller.isReviews.value == true ) {
                                       controller.isReviews.value = false;
                                     }
                                     controller.getUserCurrentLocation().then((value) async {

                                       controller.markers.add(
                                           Marker(
                                             markerId: const MarkerId("2"),
                                             position: LatLng(value.latitude, value.longitude),
                                             infoWindow: const InfoWindow(
                                               title: 'My Current Location',
                                             ),
                                           )
                                       );

                                       CameraPosition cameraPosition = CameraPosition(
                                         target: LatLng(value.latitude, value.longitude),
                                         zoom: 18,
                                       );

                                       final GoogleMapController mapController1 = await mapController.future;
                                       mapController1.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

                                       setState(() {

                                       });
                                     });
                                   },
                                   title: AppStrings.location,
                                   backgroundColor: controller.isLocation.value == false
                                       ? AppColors.lightGray.withOpacity(0.5)
                                       : Colors.black,
                                   textColor: controller.isLocation.value == false
                                       ? AppColors.gray
                                       : Colors.white
                               ),),
                               Obx(() => selectWidget(
                                   onTap: (){
                                     if ( controller.isReviews.value == false ) {
                                       controller.isReviews.value = true;
                                     }
                                     if ( controller.isAbout.value == true ) {
                                       controller.isAbout.value = false;
                                     }
                                     if ( controller.isLocation.value == true ) {
                                       controller.isLocation.value = false;
                                     }
                                   },
                                   title: AppStrings.reviews,
                                   backgroundColor: controller.isReviews.value == false
                                       ? AppColors.lightGray.withOpacity(0.5)
                                       : Colors.black,
                                   textColor: controller.isReviews.value == false
                                       ? AppColors.gray
                                       : Colors.white
                               ),)
                             ],
                           ),
                         ],
                       ),
                     ),
                      SizedBox(height: 20.h,),
                      Obx(() => controller.isAbout.value == true
                          ? aboutWidget()
                          : controller.isLocation.value == true
                          ? locationWidget() : reviewWidget()),
                      SizedBox(height: 20.h,)
                    ],
                  )
                ],
              ),
            ),
          )
      ),
      bottomNavigationBar: SizedBox(
        height: 100.h,
        width: Get.width,
        child: Center(
          child: Obx(() => Padding(
            padding:  EdgeInsets.only(bottom: 20.h),
            child: CustomButton(
                height: 52.h,
                width: 300.w,
                borderRadius: 15,
                fontSize: 15.sp,
                isHome: true,
                isSelect: controller.isEnable.value,
                onTap: (){
                  controller.isEnable.value == true
                      ? Get.toNamed(AppPages.ALLSET)
                      : null;
                },
                buttonText: AppStrings.continue_
            ),
          ),),
        ),
      ),
    );
  }

  Widget aboutWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 20.w,),
                  CustomText(
                    text: AppStrings.age,
                    color: AppColors.gray,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Expanded(child: SizedBox(width: 10.w,)),
                  CustomText(
                    text: '-',
                    fontSize: 15.sp,
                  ),
                  SizedBox(width: 20.w,),
                  SizedBox(
                    height: 35.h,
                    width: 180.w,
                    child: CustomTextField(
                      controller: controller.ageController,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.top,
                      textInputType: TextInputType.number,
                      onTap: (){
                        controller.ageController.text = " ${AppStrings.years}";
                        controller.ageController.selection = TextSelection.fromPosition(const TextPosition(offset: 0));
                      },
                      onchange: (val) {
                        if (controller.imagePath != null
                            && controller.nameController.text.isNotEmpty
                            && val.isNotEmpty
                            && controller.aboutYourselfController.text.isNotEmpty
                            && controller.idImage != null ) {
                          controller.isEnable.value = true;
                        }
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              Container(
                height: 100.h,
                width: Get.width,
                padding: EdgeInsets.only(left: 13.w, right: 13.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.lightGray.withOpacity(0.5)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.about,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.aboutYourselfController,
                        maxLines: 100,
                        style: const TextStyle(
                            fontFamily: "Poppins"
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppStrings.eAYourself,
                            hintStyle: TextStyle(
                                color: AppColors.gray,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        onChanged: (val) {
                          if (controller.imagePath != null
                              && controller.nameController.text.isNotEmpty
                              && controller.ageController.text.isNotEmpty
                              && val.isNotEmpty
                              && controller.idImage != null ) {
                            controller.isEnable.value = true;
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h,),
        controller.idImage == null ? selectImageWidget(
            onTap: (){
              controller.pickImage(true).then((value){
                setState(() {
                  if (controller.imagePath != null
                      && controller.nameController.text.isNotEmpty
                      && controller.ageController.text.isNotEmpty
                      && controller.aboutYourselfController.text.isNotEmpty
                      && controller.idImage != null ) {
                    controller.isEnable.value = true;
                  }
                });
              });
            },
            title: AppStrings.pUYPhoto,
            subTitle: AppStrings.idHere,
          padding: EdgeInsets.zero,
        ) : Container(
          height: 150.h,
          width: Get.width,
          padding: EdgeInsets.only(left: 15.w,right: 15.w),
          child: DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [6],
              strokeWidth: 1.w,
              radius: const Radius.circular(10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Stack(
                    children: [
                      Image.file(
                          File(controller.idImage!.path),
                        fit: BoxFit.cover,
                        width: Get.width,
                        height: 150.h,
                      ),
                      Positioned(
                          right: 5.w,
                          bottom: 5.h,
                          child: GestureDetector(
                            onTap: (){
                              controller.pickImage(true).then((value){
                                setState(() {

                                });
                              });
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
                  )
              )
          ),
        )
      ],
    );
  }

  Widget locationWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: SizedBox(
              height: 35.h,
                child: CustomTextField(
                    controller: controller.searchController,
                  textAlignVertical: TextAlignVertical.bottom,
                  borderRadius: 10,
                  prefixWidget: Image.asset(
                      AppImages.search,
                    color: AppColors.gray,
                    height: 10.h,
                    width: 10.w,
                  ),
                  hintText: AppStrings.search,
                  onchange: (val){},
                ))
        ),
        SizedBox(height: 10.h,),
        SizedBox(
          height: 230.h,
          child: GoogleMap(
              initialCameraPosition: controller.kGoogle,
            markers: Set<Marker>.of(controller.markers),
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller){
              mapController.complete(controller);
            },
          ),
        )
      ],
    );
  }

  Widget reviewWidget() {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Image.asset(
            AppImages.reviews,
          height: 130.h,
          width: 130.w,
        ),
        SizedBox(height: 5.h,),
        CustomText(
            text: AppStrings.noReviews,
          color: AppColors.gray,
          fontWeight: FontWeight.w500,
          fontSize: 10.sp,
        )
      ],
    );
  }
}
