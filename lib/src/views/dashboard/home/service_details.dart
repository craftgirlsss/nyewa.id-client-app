import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/helpers/currency_formator.dart';

class ServiceDetails extends StatefulWidget {
  final String? serviceName;
  final String? serviceID;
  final String? urlImage;
  const ServiceDetails({super.key, this.serviceName, this.serviceID, this.urlImage});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  int? ratingPoint = 0;
  var unit = 1.obs;
  var room = 1.obs;
  var price = 0.obs;
  var priceUnit = 50000.obs;
  var priceRoom = 20000.obs;
  var selectedHome = true.obs;
  var isLoading = false.obs;
  final textStyle = GlobalTextStyle();
  final globalVariable = GlobalVariable();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    priceRoom.value = priceRoom.value * room.value;
    priceUnit.value = priceUnit.value * unit.value;
    price.value = priceUnit.value + priceRoom.value;
    if(kDebugMode) print(priceUnit.value);
    if(kDebugMode) print(priceRoom.value);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent
      ),
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(widget.serviceName ?? "Unknown Service Name"),
          ),
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  width: size.width,
                  child: Image.asset(widget.urlImage ?? "", errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 30, color: Colors.redAccent)),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height / 6),
                      Container(
                        constraints: const BoxConstraints(
                          minWidth: 70,
                          maxWidth: 80
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: globalVariable.secondaryColor
                        ),
                        child: Row(
                          children: [
                            const Icon(Bootstrap.star_fill, color: Colors.white, size: 15),
                            const SizedBox(width: 5),
                            Text(ratingPoint == 0 || ratingPoint == null ? "0.0" : "$ratingPoint", style: textStyle.defaultTextStyleBold(color: Colors.white)),
                          ],
                        ),
                      ),
                      // title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: AutoSizeText(widget.serviceName ?? "Unknown Service Name", style: textStyle.defaultTextStyleBold(color: Colors.white), minFontSize: 28, maxFontSize: 30),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: globalVariable.secondaryColor
                                  ),
                                ),
                                const SizedBox(width: 8),
                                AutoSizeText("Tipe Bangunan", style: textStyle.defaultTextStyleMedium(), minFontSize: 16, maxFontSize: 17, maxLines: 1, overflow: TextOverflow.clip)
                              ],
                            ),
                            const SizedBox(height: 20),
                             // Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: selectedHome.value ? globalVariable.secondaryColor : Colors.black38
                                          ),
                                          backgroundColor: selectedHome.value ? globalVariable.secondaryColor : Colors.transparent,
                                          padding: const EdgeInsets.all(20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          )
                                        ),
                                        onPressed: isLoading.value ? (){} : (){
                                          selectedHome.value = true;
                                        },
                                        child: Icon(OctIcons.home, color: selectedHome.value ? Colors.white : Colors.black38)
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text("Rumah")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Obx(
                                    () => OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: selectedHome.value ? Colors.black38 : globalVariable.secondaryColor
                                          ),
                                          backgroundColor: selectedHome.value ? Colors.transparent : globalVariable.secondaryColor,
                                          padding: const EdgeInsets.all(20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          )
                                        ),
                                        onPressed: isLoading.value ? (){} : (){
                                          selectedHome.value = false;
                                        },
                                        child: Icon(Bootstrap.buildings, color: selectedHome.value ? Colors.black38 : Colors.white)
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text("Gedung")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("Jumlah Unit", style: textStyle.defaultTextStyleMedium(), maxFontSize: 17, minFontSize: 16),
                                Row(
                                  children: [
                                    Obx(() => CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: isLoading.value ? (){} : (){
                                          if(unit.value > 1){
                                            unit.value -= 1;
                                            priceUnit.value = priceUnit.value * unit.value;
                                            price.value = priceUnit.value - priceRoom.value;
                                          }
                                        },
                                        child: const Icon(AntDesign.minus_circle_fill, size: 26)
                                      ),
                                    ),
                                    Obx(() => Text(unit.value.toString(), style: textStyle.defaultTextStyleMedium())),
                                    Obx(() => CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: isLoading.value ? (){} : (){
                                          unit.value = unit.value + 1;
                                          priceUnit.value = priceUnit.value * unit.value;
                                          price.value = priceUnit.value + priceRoom.value;
                                      },
                                      child: const Icon(AntDesign.plus_circle_fill, size: 26)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(color: Colors.black12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("Jumlah Ruangan", style: textStyle.defaultTextStyleMedium(), maxFontSize: 17, minFontSize: 16),
                                Row(
                                  children: [
                                    Obx(() => CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: isLoading.value ? (){} : (){
                                        if(room.value > 1){
                                          room.value -= 1;
                                          priceRoom.value = priceRoom.value * room.value;
                                          price.value = priceUnit.value + priceRoom.value;
                                        }
                                      },
                                      child: const Icon(AntDesign.minus_circle_fill, size: 26)
                                      ),
                                    ),
                                    Obx(() => Text(room.value.toString(), style: textStyle.defaultTextStyleMedium())),
                                    Obx(() => CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: isLoading.value ? (){} : (){
                                          room.value = room.value + 1;
                                          priceRoom.value = priceRoom.value * room.value;
                                          price.value = priceUnit.value + priceRoom.value;
                                        },
                                        child: const Icon(AntDesign.plus_circle_fill, size: 26)
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Deskripsi
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: globalVariable.secondaryColor
                                  ),
                                ),
                                const SizedBox(width: 8),
                                AutoSizeText("Deskripsi", style: textStyle.defaultTextStyleMedium(), minFontSize: 16, maxFontSize: 17, maxLines: 1, overflow: TextOverflow.clip),
                                const SizedBox(height: 10),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              minLines: 6, // any number you need (It works as the rows for the textarea)
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.black12, width: 0.5)
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            constraints: const BoxConstraints(
              minHeight: 105,
              maxHeight: 110
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total: ", style: textStyle.defaultTextStyleMedium(fontSize: 15, color: Colors.black45)),
                      Obx(() => isLoading.value ? const Text("Rp 0") : Text(formatCurrencyId.format(priceUnit.value), style: textStyle.defaultTextStyleMedium(fontSize: 15, color: Colors.black))),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: (){}, child: Text("Simpan Draft", style: textStyle.defaultTextStyleBold(fontSize: 16, color: Colors.black54))
                      )
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: globalVariable.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: (){},
                        child: Text("Sewa", style: textStyle.defaultTextStyleBold(fontSize: 16, color: Colors.white)
                        )
                      )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
