import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:restro_book/modules/search/data/data.dart';
import 'package:restro_book/modules/search/model/product_category.dart';
import '../../../core/utils/string_resource.dart';
import '../model/my_header.dart';

class SearchFieldController extends GetxController {
  RxBool showShadow = false.obs;
  final RxInt _noOfMember = 1.obs;
  final RxInt _selectedMemberIndex = 0.obs;
  final RxBool _switchActive1 = false.obs;
  final RxBool _switchActive2 = false.obs;
  final Rx<DateTime> _dateTime = DateTime.now().obs;
  ///booking_confirm_screen
  TextEditingController specialRequestController = TextEditingController();
  ScrollController scrollController = ScrollController();

  set switchActive1(bool value) {
    _switchActive1.value = value;
  }

  set switchActive2(bool value) {
    _switchActive2.value = value;
  }

  set dateTime(DateTime value) {
    _dateTime.value = value;
  }

  void updateShadow(double offset) {
    if (offset > 0) {
      showShadow(true);
    } else {
      showShadow(false);
    }
  }

  List<String> listOfCategories = categories;

  late List<ProductCategory> listCategory;

  List<double> listOffsetItemHeader = [];

  final headerNotifier = ValueNotifier<MyHeader?>(null);

  final globalOffsetValue = ValueNotifier<double>(0);

  final goingDown = ValueNotifier<bool>(false);

  final valueScroll = ValueNotifier<double>(0);

  late ScrollController scrollControllerCategoryHeader;

  late ScrollController scrollControllerGlobally;

  final visibleHeader = ValueNotifier(false);

  void loadDataRandom() {
    final productsTwo = [...products];
    final productsThree = [...products];
    final productsFour = [...products];

    productsTwo.shuffle();
    productsThree.shuffle();
    productsFour.shuffle();

    listCategory = [
      ProductCategory(
        category: 'Reservation',
        //products: products,
      ),
      ProductCategory(
        category: 'Delivery & Takeout',
        //products: products,
      ),
      ProductCategory(
        category: 'Menu',
        //products: products,
      ),
      ProductCategory(
        category: 'Reviews',
        //products: products,
      ),
      ProductCategory(
        category: 'Details',
        //products: products,
      ),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadDataRandom();
    listOffsetItemHeader =
        List.generate(listCategory.length, (index) => index.toDouble());
    scrollControllerCategoryHeader = ScrollController();
    scrollControllerGlobally = ScrollController();
    scrollControllerGlobally.addListener(_listenToScrollChange);
    headerNotifier.addListener(
      _listenHeaderNotifier,
    );
    visibleHeader.addListener(_listenVisibleHeader);
  }

  void _listenVisibleHeader() {
    if (visibleHeader.value) {
      headerNotifier.value = const MyHeader(visible: false, index: 0);
    }
  }

  void _listenHeaderNotifier() {
    if (visibleHeader.value) {
      for (var i = 0; i < listCategory.length; i++) {
        scrollAnimationHorizontal(index: i);
      }
    }
  }

  void scrollAnimationHorizontal({required int index}) {
    if (headerNotifier.value?.index == index && headerNotifier.value!.visible) {
      scrollControllerCategoryHeader.animateTo(
        listOffsetItemHeader[headerNotifier.value!.index] - 16,
        duration: const Duration(milliseconds: 300),
        curve: goingDown.value ? Curves.bounceOut : Curves.fastOutSlowIn,
      );
    }
  }

  void _listenToScrollChange() {
    globalOffsetValue.value = scrollControllerGlobally.offset;
    if (scrollControllerGlobally.position.userScrollDirection ==
        ScrollDirection.reverse) {
      goingDown.value = true;
    } else {
      goingDown.value = false;
    }
  }

  set noOfMember(int value){
    _noOfMember.value = value;
    update();
  }

  void setSelectedMember(int index) {
    _selectedMemberIndex.value = index;
    noOfMember = index + 1;
    print('member is : $noOfMember');
    scrollController.animateTo((index) * 65, duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
    update();
  }

  @override
  void onClose() {
    super.onClose();
    scrollControllerCategoryHeader.dispose();
    scrollControllerGlobally.dispose();
  }

  void refreshHeader(int index, bool visible, {int? lastIndex}) {
    final headerValue = headerNotifier.value;
    final headerTitle = headerValue?.index ?? index;
    final headerVisible = headerValue?.visible ?? false;

    if (headerTitle != index || lastIndex != null || headerVisible != false) {
      Future.microtask(() {
        if (!visible && lastIndex != null) {
          headerNotifier.value = MyHeader(visible: true, index: lastIndex);
        } else {
          headerNotifier.value = MyHeader(visible: false, index: index);
        }
      });
    }
  }

  int get noOfMember =>  _noOfMember.value;
  int get selectedMemberIndex => _selectedMemberIndex.value;
  bool get switchActive1 => _switchActive1.value;
  bool get switchActive2 => _switchActive2.value;
  DateTime get dateTime => _dateTime.value;
}
