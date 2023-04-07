import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
import 'package:wad_wad/features/add_dog_profile/controller/add_dog_profile_controller.dart';

class AddDogProfileScreen extends StatefulWidget {
   const AddDogProfileScreen({Key? key}) : super(key: key);

  @override
  State<AddDogProfileScreen> createState() => _AddDogProfileScreenState();
}

class _AddDogProfileScreenState extends State<AddDogProfileScreen> {
   final addDogProfileController = Get.put(AddDogProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addDogProfileController.imagePath == null ? AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
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
            text: AppStrings.aDProfile,
          color: Colors.black,
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
        ),
      ) : null,
      body: ScrollConfiguration(
        behavior: AppBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              addDogProfileController.imagePath == null
                  ? selectImageWidget(
                onTap: (){
                addDogProfileController.pickImage().then((value) {
                  setState(() {

                  });
                });
              },
                title: AppStrings.uImage,
                subTitle: AppStrings.dIHere
              ) : displayImageWidget(
                  imagePath: addDogProfileController.imagePath!.path,
                  onTap: (){
                    addDogProfileController.pickImage().then((value) {
                      setState(() {

                      });
                    });
                  }
              ),
               SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  children: [
                    Obx(() => CustomTextField(
                      controller: addDogProfileController.dogNameController,
                      hintText: AppStrings.eYDName,
                      labelPadding: addDogProfileController.isDogName.value == true ? EdgeInsets.only(top: 30.h) : EdgeInsets.zero,
                      isType: addDogProfileController.dogNameType.value,
                      onchange: (val){
                        if ( val.isNotEmpty ) {
                          addDogProfileController.isDogName.value = true;
                          addDogProfileController.dogNameType.value = true;
                        }
                        if ( val.isNotEmpty
                            && addDogProfileController.aboutYourselfController.value.text.isNotEmpty) {
                          if ( addDogProfileController.isEnable.value == false) {
                            addDogProfileController.isEnable.value = true;
                          }
                        }
                        if ( val.isEmpty ) {
                          addDogProfileController.dogNameType.value = false;
                          if ( addDogProfileController.isEnable.value == true ) {
                            addDogProfileController.isEnable.value = false;
                          }
                        }
                      },
                    )),
                    SizedBox(height: 2.h,),
                    Divider(
                      thickness: 1.2.h,
                      color: AppColors.gray.withOpacity(0.2),
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() => selectWidget(
                            onTap: (){
                              if ( addDogProfileController.isAbout.value == false ) {
                                addDogProfileController.isAbout.value = true;
                              }
                              if ( addDogProfileController.isGeneralInfo.value == true ) {
                                addDogProfileController.isGeneralInfo.value = false;
                              }
                              if ( addDogProfileController.isBehavior.value == true ) {
                                addDogProfileController.isBehavior.value = false;
                              }
                              if ( addDogProfileController.dogNameController.text.isEmpty
                                  || addDogProfileController.aboutYourselfController.text.isEmpty ) {
                                addDogProfileController.isEnable.value = false;
                              } else {
                                addDogProfileController.isEnable.value = true;
                              }
                            },
                            title: AppStrings.about,
                            backgroundColor: addDogProfileController.isAbout.value == false
                                ? AppColors.lightGray.withOpacity(0.5)
                                : Colors.black,
                            textColor: addDogProfileController.isAbout.value == false
                                ? AppColors.gray
                                : Colors.white
                        ),),
                        Obx(() =>  selectWidget(
                            onTap: (){
                              if ( addDogProfileController.isGeneralInfo.value == false ) {
                                addDogProfileController.isGeneralInfo.value = true;
                              }
                              if ( addDogProfileController.isAbout.value == true ) {
                                addDogProfileController.isAbout.value = false;
                              }
                              if ( addDogProfileController.isBehavior.value == true ) {
                                addDogProfileController.isBehavior.value = false;
                              }
                              if ( addDogProfileController.dogNameController.value.text.isEmpty
                                  || addDogProfileController.dogBreedController.value.text.isEmpty
                                  || addDogProfileController.weightController.value.text.isEmpty
                                  || addDogProfileController.noteController.value.text.isEmpty
                              ) {
                                addDogProfileController.isEnable.value = false;
                              } else {
                                addDogProfileController.isEnable.value = true;
                              }
                            },
                            title: AppStrings.gInfo,
                            backgroundColor: addDogProfileController.isGeneralInfo.value == false
                                ? AppColors.lightGray.withOpacity(0.5)
                                : Colors.black,
                            textColor: addDogProfileController.isGeneralInfo.value == false
                                ? AppColors.gray
                                : Colors.white
                        ),),
                        Obx(() => selectWidget(
                            onTap: (){
                              if ( addDogProfileController.isBehavior.value == false ) {
                                addDogProfileController.isBehavior.value = true;
                              }
                              if ( addDogProfileController.isAbout.value == true ) {
                                addDogProfileController.isAbout.value = false;
                              }
                              if ( addDogProfileController.isGeneralInfo.value == true ) {
                                addDogProfileController.isGeneralInfo.value = false;
                              }
                            },
                            title: AppStrings.behavior,
                            backgroundColor: addDogProfileController.isBehavior.value == false
                                ? AppColors.lightGray.withOpacity(0.5)
                                : Colors.black,
                            textColor: addDogProfileController.isBehavior.value == false
                                ? AppColors.gray
                                : Colors.white
                        ),)
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Obx(() => addDogProfileController.isAbout.value == true
                        ? aboutWidget()
                        : addDogProfileController.isGeneralInfo.value == true
                        ? generalInfoWidget()
                        : behaviorWidget())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        width: Get.width,
        child: Center(
          child: Obx(() => CustomButton(
              height: 52.h,
              width: 300.w,
              borderRadius: 15,
              fontSize: 15.sp,
              isHome: true,
              isSelect: addDogProfileController.isEnable.value,
              onTap: (){},
              buttonText: AppStrings.next
          ),),
        ),
      ),
    );
  }

  Widget aboutWidget() {
    return Container(
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
              controller: addDogProfileController.aboutYourselfController,
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
                if (val.isNotEmpty
                    && addDogProfileController.dogNameController.value.text.isNotEmpty) {
                  addDogProfileController.isEnable.value = true;
                }
                if ( val.isEmpty ) {
                  addDogProfileController.isEnable.value = false;
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget generalInfoWidget() {
    return Container(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                  text: AppStrings.dogBreed,
                color: AppColors.gray,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
              Expanded(child: SizedBox(width: 10.w,)),
              CustomText(
                  text: '-',
                fontSize: 15.sp,
              ),
              SizedBox(width: 12.w,),
              SizedBox(
                height: 33.h,
                width: 160.w,
                child: CustomTextField(
                    controller: addDogProfileController.dogBreedController,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.top,
                  onchange: (val) {
                      if ( val.isNotEmpty ) {
                        if ( addDogProfileController.dogNameController.value.text.isNotEmpty
                        && addDogProfileController.weightController.value.text.isNotEmpty
                        && addDogProfileController.noteController.value.text.isNotEmpty ) {
                          if ( addDogProfileController.isEnable.value == false ) {
                            addDogProfileController.isEnable.value = true;
                          }
                        }
                      }
                      if ( val.isEmpty ) {
                        if ( addDogProfileController.isEnable.value == true ) {
                          addDogProfileController.isEnable.value = false;
                        }
                      }
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 25.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                text: AppStrings.weight,
                color: AppColors.gray,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
              Expanded(child: SizedBox(width: 10.w,)),
              CustomText(
                text: '-',
                fontSize: 15.sp,
              ),
              SizedBox(width: 12.w,),
              SizedBox(
                height: 33.h,
                width: 160.w,
                child: CustomTextField(
                    controller: addDogProfileController.weightController,
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.center,
                  onchange: (val) {
                      if ( val.isNotEmpty
                          && addDogProfileController.dogNameController.value.text.isNotEmpty
                          && addDogProfileController.dogBreedController.value.text.isNotEmpty
                          && addDogProfileController.noteController.value.text.isNotEmpty ) {
                        if ( addDogProfileController.isEnable.value == false ) {
                          addDogProfileController.isEnable.value = true;
                        }
                      }
                      if ( val.isEmpty ) {
                        if ( addDogProfileController.isEnable.value == true ) {
                          addDogProfileController.isEnable.value = false;
                        }
                      }
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 20.h,),
          CustomText(
              text: AppStrings.mNote,
            fontSize: 13.sp,
            color: AppColors.gray,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10.h,),
          Container(
        height: 100.h,
        width: Get.width,
        padding: EdgeInsets.only(left: 13.w, right: 13.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.lightGray.withOpacity(0.3)
        ),
        child: TextFormField(
          controller: addDogProfileController.noteController,
          maxLines: 100,
          style: const TextStyle(
              fontFamily: "Poppins"
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppStrings.pANote,
              hintStyle: TextStyle(
                  color: AppColors.gray.withOpacity(0.7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500
              )
          ),
          onChanged: (val) {
            if ( val.isNotEmpty ) {
              if ( addDogProfileController.dogNameController.value.text.isNotEmpty
                  && addDogProfileController.dogBreedController.value.text.isNotEmpty
                  && addDogProfileController.weightController.value.text.isNotEmpty ) {
                if (addDogProfileController.isEnable.value == false ) {
                  addDogProfileController.isEnable.value = true;
                }
              }
            }
            if ( val.isEmpty ) {
              if ( addDogProfileController.isEnable.value == true ) {
                addDogProfileController.isEnable.value = false;
              }
            }
          },
        ),
      )
        ],
      ),
    );
  }

  Widget behaviorWidget() {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Column(
        children: [
          Obx(() => behaviorCommonWidget(
              title: AppStrings.fWKids,
              value: addDogProfileController.isFWKids.value,
            toggle: (){
                addDogProfileController.kidsToggle();
            }
          ),),
          SizedBox(height: 10.h,),
          Obx(() => behaviorCommonWidget(
              title: AppStrings.fWAdults,
              value: addDogProfileController.isFWAdults.value,
              toggle: (){
                addDogProfileController.adultsToggle();
              }
          ),),
          SizedBox(height: 10.h,),
          Obx(() => behaviorCommonWidget(
              title: AppStrings.fWCats,
              value: addDogProfileController.isFWCats.value,
              toggle: (){
                addDogProfileController.catsToggle();
              }
          )),
          SizedBox(height: 10.h,),
          Obx(() => behaviorCommonWidget(
              title: AppStrings.fWOtherPets,
              value: addDogProfileController.isFWOtherPets.value,
              toggle: (){
                addDogProfileController.otherPetsToggle();
              }
          )),
          SizedBox(height: 10.h,),
          Obx(() => behaviorCommonWidget(
              title: AppStrings.fWLoudNoises,
              value: addDogProfileController.isFWLoudNoises.value,
              toggle: (){
                addDogProfileController.loudNoisesToggle();
              }
          )),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }

  Widget behaviorCommonWidget({
    required String title,
    required bool value,
    required Function toggle
  }) {
    return Row(
      children: [
        CustomText(
          text: title,
          fontSize: 14.sp,
          color: AppColors.gray,
          fontWeight: FontWeight.w500,
        ),
        Expanded(child: SizedBox(width: 10.w,)),
        CupertinoSwitch(
          value: value,
          onChanged: (val) {
            toggle();
          },
          activeColor: Colors.black,
        )
      ],
    );
  }
}
