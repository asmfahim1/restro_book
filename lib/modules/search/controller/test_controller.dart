import 'package:get/get.dart';
import '../../../core/utils/string_resource.dart';

class SearchFieldController extends GetxController{

  RxBool showShadow = false.obs;

  void updateShadow(double offset) {
    if (offset > 0) {
      showShadow(true);
    } else {
      showShadow(false);
    }
  }


  List<String> listOfCategories = categories;


}