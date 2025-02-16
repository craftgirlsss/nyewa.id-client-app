import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:nyewadotid/src/components/button/material_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/components/utilities/utilities.dart';
import 'package:nyewadotid/src/controllers/utilities/utilities_controller.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  final textStyle = GlobalTextStyle();
  final utilities = Utilities();
  var showAnimation = false.obs;
  LocationController locationController = Get.find();
  TextEditingController searchController = TextEditingController();
  MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    LatLng myPlace = LatLng(locationController.myLatitude.value, locationController.myLongitude.value);
    Future.delayed(Duration.zero, (){
      if(locationController.myLocation.value != ""){
        showAddressLocation();
      }
    });
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pilih Lokasi Anda"),
          elevation: 0,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          actions: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                await locationController.getCurrentLocation().then((value){
                  mapController.move(LatLng(locationController.myLatitude.value, locationController.myLongitude.value), 15);
                });
              },
              child: Icon(Icons.gps_fixed_rounded, color: GlobalVariable.secondaryColor),
            )
          ],
        ),
        body: Stack(
          children: [
            Obx(() => AnimatedOpacity(
              opacity: locationController.isLoading.value ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  onTap: (tapPosition, point) {
                    locationController.myLatitude.value = point.latitude;
                    locationController.myLongitude.value = point.longitude;
                    myPlace = LatLng(locationController.myLatitude.value, locationController.myLongitude.value);
                    if(point.longitude != 0 || point.latitude != 0){
                      Future.delayed(Duration.zero, (){
                        getAddressNameFromLatLong().then((value) {
                          if(value != ""){
                            showAddressLocation();
                          }
                        });
                      });
                    }
                  },
                  initialCenter: myPlace, // Center the map over London
                  initialZoom: 15,
                ),
                children: [
                  TileLayer( //
                    // Display map tiles from any source
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                    userAgentPackageName: 'com.example.app',
                    maxNativeZoom: 19, // Scale tiles when the server doesn't support higher zoom levels
                    errorImage: NetworkImage("${GlobalVariable.primaryURL}/maps-error.png"),
                    retinaMode: true,
                  ),
                  Obx(() => locationController.isLoading.value ? Container() : MarkerLayer(
                    markers: [
                      Marker(
                        rotate: true,
                        point: LatLng(locationController.myLatitude.value, locationController.myLongitude.value),
                        child: const Icon(Icons.location_on, color: Colors.red),
                      )]
                    ),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: SizedBox(
                height: 47,
                child: SearchBar(
                  onTap: (){},
                  elevation: const WidgetStatePropertyAll(3),
                  controller: searchController,
                  hintText: "Cari lokasi pengiriman",
                  leading: const Icon(EvaIcons.search),
                  shadowColor: const WidgetStatePropertyAll(Colors.black45),
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ),
            Obx(() => locationController.isLoading.value ? utilities.floatingLoading() : Container())
          ],
        ),
      ),
    );
  }

  Future<String> getAddressNameFromLatLong() async {
    try{
      List<Placemark> placemarkList = await placemarkFromCoordinates(
        locationController.myLatitude.value,
        locationController.myLongitude.value,
      );
      if(placemarkList.isNotEmpty){
        Placemark place = placemarkList[0];
        return locationController.myLocation.value = "${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
      }
      return locationController.myLocation.value = "failed_get_location".tr;
    }catch (e){
      if(kDebugMode) print(e.toString());
      return locationController.myLocation.value = "failed_get_location".tr;
    }
  }

  showAddressLocation(){
    showModalBottomSheet(
      elevation: 0,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context, builder: (context) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                dense: true,
                title: Text("Alamat Lengkap", style: textStyle.defaultTextStyleMedium()),
                subtitle: Text(locationController.myLocation.value, style: textStyle.defaultTextStyle(color: Colors.black54), maxLines: 2),
              ),
              Obx(() => kDefaultElevatedButton(
                  onPressed: locationController.isLoading.value ? null : (){
                    locationController.myLocationSelected.value = locationController.myLocation.value;
                    Navigator.pop(context);
                  },
                  title: "Simpan Alamat Saya"
                ),
              )
            ],
          ),
        )
      )
    );
  }
}