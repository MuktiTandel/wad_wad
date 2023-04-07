import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wad_wad/core/const/app_const.dart';

class AddDogProfileController extends GetxController {

  final TextEditingController dogNameController = TextEditingController();
  final TextEditingController aboutYourselfController = TextEditingController();

  final TextEditingController dogBreedController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  RxBool isDogName = false.obs;
  RxBool dogNameType = false.obs;

  RxBool isAboutYourself = false.obs;
  RxBool aboutYourselfType = false.obs;

  RxBool isAbout = true.obs;
  RxBool isGeneralInfo = false.obs;
  RxBool isBehavior = false.obs;

  RxBool isEnable = false.obs;

  RxBool isFWKids = false.obs;
  RxBool isFWAdults = false.obs;
  RxBool isFWCats = false.obs;
  RxBool isFWOtherPets = false.obs;
  RxBool isFWLoudNoises = false.obs;

  File? imagePath;

  Future pickImage() async {
    try {

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      imagePath = File(image.path);

      AppConst().debug('image path => ${imagePath!.path}');

    } on PlatformException catch(e) {
      AppConst().debug('Failed to pick image: $e');
    }
  }

  void kidsToggle() => isFWKids.value = isFWKids.value ? false : true;

  void adultsToggle() => isFWAdults.value = isFWAdults.value ? false : true;

  void catsToggle() => isFWCats.value = isFWCats.value ? false : true;

  void otherPetsToggle() => isFWOtherPets.value = isFWOtherPets.value ? false : true;

  void loudNoisesToggle() => isFWLoudNoises.value = isFWLoudNoises.value ? false : true;
}