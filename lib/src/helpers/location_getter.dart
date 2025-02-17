import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getAddressFromLangitudeAndLongitude(Position param) async {
    try {
      List<Placemark> placemarkList = await placemarkFromCoordinates(
        param.latitude,
        param.longitude,
      );
      if(placemarkList.isNotEmpty){
        Placemark place = placemarkList[0];
        return "${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}";
      }
      return "failed_get_location";
    } catch (e) {
      return "failed_get_location";
    }
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

Future<Map<String, dynamic>> getLatLongMe() async {
  Position position = await determinePosition();
  String address = await getAddressFromLangitudeAndLongitude(position);
  return {
    "latitude"  : position.latitude,
    "longitude" : position.longitude,
    "address"   : address
  };
}