import 'dart:math';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomeController extends GetxController {
  RxBool isFinished = false.obs;

  void onWaitingProcess() {
    Future.delayed(Duration(seconds: 2), () {
      isFinished.value = true;
    });
  }

  void onFinish(){
    getLocation();
    accelerometerData();
    isFinished.value = false;
    
  }

  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle denied permission
    } else if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition();
      double latitude = position.latitude;
      double longitude = position.longitude;
      print("Latitude: $latitude, Longitude: $longitude");
    }
  }

  void accelerometerData() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      double x = event.x;
      double y = event.y;
      double z = event.z;
      // print("Accelerometer Data - X: $x, Y: $y, Z: $z");
      double totalAcceleration = sqrt(x * x + y * y + z * z);
      print(totalAcceleration);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
