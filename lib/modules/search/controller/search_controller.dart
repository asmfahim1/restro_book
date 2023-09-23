import 'package:get/get.dart';

class SearchController extends GetxController{

  RxBool showShadow = false.obs;

  void updateShadow(double offset) {
    if (offset > 0) {
      showShadow(true);
    } else {
      showShadow(false);
    }
  }
}