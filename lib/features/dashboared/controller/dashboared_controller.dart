import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashBoredController extends GetxController {

  RxInt pageIndex = 0.obs;

  void changePageIndex(int index) {
    pageIndex.value = index;
  }

}