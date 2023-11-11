import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:restro_book/core/utils/extensions.dart';

class HomeController extends GetxController {
  final RxBool gettingLocation = false.obs;
  final RxInt _noOfMember = 1.obs;
  final RxInt _selectedMemberIndex = 0.obs;
  final Rx<DateTime> _dateTime = DateTime.now().obs;
  final RxString _myLocation = ''.obs;
  final RxString _myLatitude = ''.obs;
  final RxString _myLongitude = ''.obs;
  ScrollController scrollController = ScrollController();

  int tabIndex = 3;
  late TabController tabController;
  final RxInt _currentIndex = 0.obs;
  set currentIndex(int index) {
    _currentIndex.value = index;
    update();
  }

  set dateTime(DateTime value) {
    _dateTime.value = value;
  }

  set myLocation(String value) {
    _myLocation.value = value;
  }

  set myLatitude(String value) {
    _myLatitude.value = value;
  }

  set myLongitude(String value) {
    _myLongitude.value = value;
  }

  set noOfMember(int value) {
    _noOfMember.value = value;
    update();
  }

  void setSelectedMember(int index) {
    _selectedMemberIndex.value = index;
    noOfMember = index + 1;
    scrollController.animateTo((index) * 65,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn);
    update();
  }

  void toggleTab() {
    tabIndex = tabController.index + 1;
    tabController.animateTo(tabIndex);
    update();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void getMyLocation() async {
    gettingLocation(true);
    Position position = await _determinePosition();
    myLatitude = position.latitude.toString();
    myLongitude = position.longitude.toString();
    await getMyAddress(double.parse(myLatitude), double.parse(myLongitude));
    gettingLocation(false);
    "latitude is : $myLatitude".log();
    "Longitude is : $myLongitude".log();
  }

  Future<void> getMyAddress(double lat, double lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark address = placeMark[0];
    myLocation = '${address.subLocality}, ${address.locality}';
    "My current address is : $placeMark".log();
  }

  int get currentIndex => _currentIndex.value;
  String get myLocation => _myLocation.value;
  String get myLatitude => _myLatitude.value;
  String get myLongitude => _myLongitude.value;
  int get noOfMember => _noOfMember.value;
  int get selectedMemberIndex => _selectedMemberIndex.value;
  DateTime get dateTime => _dateTime.value;
}
