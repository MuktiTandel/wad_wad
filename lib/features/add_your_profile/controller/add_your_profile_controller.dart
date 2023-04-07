import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wad_wad/core/const/app_const.dart';

class AddYourProfileController extends GetxController {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController aboutYourselfController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  RxBool isName = false.obs;
  RxBool nameType = false.obs;

  RxBool isAbout = true.obs;
  RxBool isLocation = false.obs;
  RxBool isReviews = false.obs;

  RxBool isEnable = false.obs;

  File? imagePath;

  File? idImage;

  CameraPosition kGoogle = const CameraPosition(
    target: LatLng(20.5992, 72.9342),
    zoom: 18.4746,
  );

  List<Marker> markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.5992, 72.9342),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      AppConst().debug("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  Future pickImage(bool isIdImage) async {
    try {

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      if ( isIdImage == false ) {
        imagePath = File(image.path);

        AppConst().debug('image path => ${imagePath!.path}');
      } else {
        idImage = File(image.path);
        AppConst().debug('id image path => ${idImage!.path}');
      }

    } on PlatformException catch(e) {
      AppConst().debug('Failed to pick image: $e');
    }
  }

}