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
import 'package:wad_wad/features/add_dog_owner_profile/controller/add_dog_owner_profile_controller.dart';

class AddDogOwnerProfileScreen extends StatefulWidget {
  const AddDogOwnerProfileScreen({Key? key}) : super(key: key);

  @override
  State<AddDogOwnerProfileScreen> createState() => _AddDogOwnerProfileScreenState();
}

class _AddDogOwnerProfileScreenState extends State<AddDogOwnerProfileScreen> {

  final controller = Get.put(AddDogOwnerProfileController());

  Completer<GoogleMapController> mapController = Completer();

  @override
  void initState() {
    super.initState();
  }

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
          text: AppStrings.aDOProfile,
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
                        controller.pickImage(false, false).then((value) {
                          setState(() {
                            if (controller.imagePath != null
                                && controller.nameController.text.isNotEmpty
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
                        controller.pickImage(false, false).then((value) {
                          setState(() {
                            if (controller.imagePath != null
                                && controller.nameController.text.isNotEmpty
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
                                  if ( controller.aboutYourselfController.text.isNotEmpty
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
                                      if ( controller.isAbout.value == false ) {
                                        controller.isAbout.value = true;
                                      }
                                      if ( controller.isLocation.value == true ) {
                                        controller.isLocation.value = false;
                                      }
                                      if ( controller.isImages.value == true ) {
                                        controller.isImages.value = false;
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
                                      if ( controller.isImages.value == true ) {
                                        controller.isImages.value = false;
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
                                      if ( controller.isImages.value == false ) {
                                        controller.isImages.value = true;
                                      }
                                      if ( controller.isAbout.value == true ) {
                                        controller.isAbout.value = false;
                                      }
                                      if ( controller.isLocation.value == true ) {
                                        controller.isLocation.value = false;
                                      }
                                    },
                                    title: AppStrings.images,
                                    backgroundColor: controller.isImages.value == false
                                        ? AppColors.lightGray.withOpacity(0.5)
                                        : Colors.black,
                                    textColor: controller.isImages.value == false
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
                          ? locationWidget() : imagesWidget()),
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
            controller.pickImage(true, false).then((value){
              setState(() {
                if (controller.imagePath != null
                    && controller.nameController.text.isNotEmpty
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
                              controller.pickImage(true, false).then((value){
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

  Widget imagesWidget() {
    return controller.dogImagesList.isEmpty ? Column(
      children: [
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.only(left: 40.w, right: 40.w),
          child: CustomText(
              text: AppStrings.mImagesDesc,
            textAlign: TextAlign.center,
            color: AppColors.gray,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20.h,),
        selectImageWidget(
            onTap: (){
              controller.pickImage( true, true).then((value) {
                setState(() {
                  controller.dogImagesList.add(displayDogImage(dogImage: controller.dogImage!.path, index: controller.dogImagesList.length));
                  controller.dogImagesList.add(addMoreWidget());
                });
              });
            },
            title: AppStrings.uImage,
            subTitle: AppStrings.dIHere
        )
      ],
    ) : SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w),
        child: GridView.builder(
          shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.h,
                mainAxisSpacing: 10.w,
              childAspectRatio: 2 / 2.9
            ),
            itemCount: controller.dogImagesList.length,
            itemBuilder: (BuildContext context, int index) {
              return controller.dogImagesList[index];
            }
        ),
      ),
    );
  }

  Widget addMoreWidget() {
    return GestureDetector(
      onTap: (){
        controller.pickImage( true, true).then((value) {
          setState(() {
            controller.dogImagesList.insert( controller.dogImagesList.length - 2 ,displayDogImage(dogImage: controller.dogImage!.path, index: controller.dogImagesList.length));
          });
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              AppImages.add,
            color: AppColors.orange,
            height: 15.h,
            width: 15.w,
          ),
          SizedBox(width: 10.w,),
          CustomText(
              text: AppStrings.aMore,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.orange,
          )
        ],
      ),
    );
  }

  Widget displayDogImage({ required String dogImage, required int index}) {
    return Stack(
      children: [
        SizedBox(
          height: 300.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              File(dogImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Padding(
            padding:  EdgeInsets.all(5.w),
            child: GestureDetector(
              onTap: (){
                controller.dogImagesList.removeAt(index);
              },
              child: Container(
                height: 25.h,
                padding: EdgeInsets.all(6.w),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white54
                ),
                child: Image.asset(
                  AppImages.bin,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

}
