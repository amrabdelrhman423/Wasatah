import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MapController extends GetxController {
  BitmapDescriptor? customIcon;
  List<Marker> allMarkers = [];
  int index = 0;
  GoogleMapController? controller;
  LatLng currentPostion=    LatLng(31.043227, 31.382200);
  //final controllerScrolllistview = ScrollController();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  Completer<GoogleMapController> controllermap = Completer();

  @override
  void onInit() {
    super.onInit();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(8, 8)), "assets/marker.png")
        .then((d) {
      customIcon = d;
      _getNearByCars();
      getUserLocation();
      update();
    });
  }

  void getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    if (currentPostion == null) {
      currentPostion = LatLng(position.latitude, position.longitude);
    } else {
      currentPostion = LatLng(position.latitude, position.longitude);
      goToTheLake(position.latitude, position.longitude, 0);
      print(position.latitude);
      print(position.longitude);
    }
  }

  changelocationZoom(int indexitem) {
    index = indexitem;
    update();
  }

  final nearbyLocation = [
    LatLng(31.041977, 31.379490),
    LatLng(31.040433, 20.377171),
    LatLng(31.045875, 31.382200),
    LatLng(31.043227, 31.382200),
    LatLng(31.045287, 31.384705),
    LatLng(31.034403, 31.368902),
    LatLng(31.041168, 31.383674),
  ];

  void _getNearByCars() {
    for (var i = 0; i < nearbyLocation.length; i++) {
      var now = new DateTime.now().millisecondsSinceEpoch;
      allMarkers.add(Marker(
          markerId: MarkerId(nearbyLocation[i].toString() + now.toString()),
          position: nearbyLocation[i],
          infoWindow: InfoWindow(
            title: "فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت",
          ),
          onTap: () {
            goToTheLake(
                nearbyLocation[i].latitude, nearbyLocation[i].longitude, i);
          },
          icon: customIcon!));
    }
    update();
  }

  Future<void> goToTheLake(x, y, index) async {
    final GoogleMapController controller = await controllermap.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(x, y),
      zoom: 15,
    )));
    itemScrollController.scrollTo( // 100 is the height of container and index of 6th element is 5
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease, index: index);
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
