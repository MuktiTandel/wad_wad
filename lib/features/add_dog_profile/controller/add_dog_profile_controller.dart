import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wad_wad/core/const/app_const.dart';

class AddDogProfileController extends GetxController {

  final TextEditingController dogNameController = TextEditingController();
  final TextEditingController aboutYourselfController = TextEditingController();

  File? image;
  File? imagePath;

  Future pickImage() async {
    try {

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      imagePath = File(image.path);

    } on PlatformException catch(e) {
      AppConst().debug('Failed to pick image: $e');
    }
  }
}