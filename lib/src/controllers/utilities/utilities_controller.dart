import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  var isLoading = false.obs;
  var myLocation = "".obs;
  var myLocationSelected = "".obs;
  var myOfficeLocation = "".obs;
  var myLatitude = RxDouble(0);
  var myLongitude = RxDouble(0);
  var distanceBetweenMeAndOffice = 0.obs;
  var currentOfficeLatitude = RxDouble(-7.4396182);
  var currentOfficeLongitude = RxDouble(112.7184);
  Position? positioned;
  final Set<Marker> marked = {};

  @override
  onInit(){
    super.onInit();
    getCurrentLocation().then((value) {
      getOfficeLocation();
    });
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromLangitudeAndLongitude(Position param) async {
    try {
      List<Placemark> placemarkList = await placemarkFromCoordinates(
        param.latitude,
        param.longitude,
      );
      if(placemarkList.isNotEmpty){
        Placemark place = placemarkList[0];
        return myLocation.value = "${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
      }
      return myLocation.value = "failed_get_location".tr;
    } catch (e) {
      if(kDebugMode) print(e.toString());
      return myLocation.value = "failed_get_location".tr;
    }
  }

  Future<void> getCurrentLocation() async {
    isLoading(true);
    Position position = await determinePosition();
    String address = await getAddressFromLangitudeAndLongitude(position);
    positioned = position;
    myLatitude.value = position.latitude;
    myLongitude.value = position.longitude;
    myLocation.value = address;
    isLoading(false);
  }

  Future<void> marker() async {
    marked.add(Marker(
        markerId: MarkerId("my_location".tr),
        position: LatLng(myLatitude.value, myLongitude.value),
        infoWindow: InfoWindow(title: "your_position".tr, snippet: myLocation.value)
    ));
    if(kDebugMode){
      print("ini latitude saya => ${myLatitude.value}");
      print("ini longitude saya => ${myLongitude.value}");
    }
    distanceBetweenMeAndOffice.value = Geolocator.distanceBetween(-7.4396182, 112.7184, myLatitude.value, myLongitude.value).round();
  }

  Future<String> getOfficeLocation() async {
    try {
      List<Placemark> placemarkList = await placemarkFromCoordinates(
        currentOfficeLatitude.value,
        currentOfficeLongitude.value,
      );
      marker();
      if(placemarkList.isNotEmpty){
        Placemark place = placemarkList[0];
        return myOfficeLocation.value = "${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
      }
      return myOfficeLocation.value = "failed_get_location".tr;
    } catch (e) {
      if(kDebugMode) print(e.toString());
      return myOfficeLocation.value = "failed_get_location".tr;
    }
  }
}