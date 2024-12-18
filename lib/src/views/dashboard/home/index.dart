import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/utilities/utilities.dart';
import 'package:nyewadotid/src/views/dashboard/home/search_page.dart';
import 'package:nyewadotid/src/views/dashboard/home/service_details.dart';
import '../../../components/global/index.dart';
import '../../../components/textsyle/index.dart';
import 'all_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textStyle = GlobalTextStyle();
  final utilities = Utilities();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: RefreshIndicator(
            backgroundColor: GlobalVariable.secondaryColor,
            color: Colors.white,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () async {},
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  // Search Box
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello, Putra 👋", style: textStyle.defaultTextStyleMedium(fontSize: 17, color: Colors.black54)),
                        AutoSizeText("Apa yang anda butuhkan hari ini?", maxFontSize: 30, minFontSize: 25, maxLines: 2, style: textStyle.defaultTextStyleBold()),
                        const SizedBox(height: 10),
                        TextField(
                          readOnly: true,
                          // onTap: () => Get.to(() => const SearchPage()),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage())),
                          onSubmitted: (value) => debugPrint(value),
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Iconsax.search_normal_outline, color: Colors.black38),
                            hintText: "Cari yang anda inginkan...",
                            hintStyle: textStyle.defaultTextStyleMedium(color: Colors.black38),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(color: Colors.black12, width: 0.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(color: Colors.black12, width: 0.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Category Box
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        utilities.cardTitle(title: "Shortcut"),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            categoryItem(iconData: MingCute.air_condition_open_fill, title: "Service AC"),
                            categoryItem(iconData: FontAwesome.tent_solid, color: Colors.blue, title: "Tenda Pernikahan"),
                            categoryItem(iconData: MingCute.broom_fill, color: Colors.deepOrangeAccent, title: "Home Clean"),
                            categoryItem(iconData: FontAwesome.arrow_right_solid, color: Colors.deepPurpleAccent, title: "Lihat Semua", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllCategory()))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
            
                  // Shortcut GET OFF Item
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            utilities.cardTitle(title: "Get OFF!"),
                            SizedBox(
                              height: 35,
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Colors.black12
                                    ),
                                    padding: const EdgeInsets.only(left: 15, right: 5)
                                ),
                                onPressed: (){},
                                iconAlignment: IconAlignment.end,
                                icon: const Icon(Icons.keyboard_arrow_right, size: 17, color: Colors.black54),
                                label: Text("Lihat Semua", style: textStyle.defaultTextStyleMedium(color: Colors.black45))
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              cardItem(urlImage: 'assets/images/cleaning.jpg', priceOff: 10, title: "Klin Klin Cleaning", onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetails(serviceName: "Klin Klin Cleaning", urlImage: 'assets/images/cleaning.jpg')));
                              }),
                              cardItem(urlImage: 'assets/images/sound.jpg', priceOff: 5, title: "Ireng Sound System"),
                              cardItem(urlImage: 'assets/images/tenda.jpg', priceOff: 8, title: "Raja Tenda"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
            
                  // Voucher Box
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        utilities.cardTitle(title: "Vouchers"),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              couponCard(onPressed: (){}),
                              couponCard(onPressed: (){}, color: Colors.greenAccent.shade100),
                              couponCard(onPressed: (){}, color: Colors.lightBlueAccent.shade100),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Container Card Item
  Widget cardItem({int? priceOff, String? urlImage, String? title, Function()? onPressed}){
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black38, width: 0.3),
                image: DecorationImage(image: AssetImage(urlImage ?? ''), fit: BoxFit.cover, onError: (exception, stackTrace) => const Icon(Bootstrap.box, size: 30))
              ),
              child: Stack(
                children: [
                  if(priceOff != null || priceOff == 0)
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: GlobalVariable.secondaryColor
                        ),
                        child: Text("$priceOff% OFF", style: textStyle.defaultTextStyleMedium(color: Colors.white)),
                      )
                    )
                ],
              ),
            ),
            const SizedBox(height: 8),
            AutoSizeText(title ?? "Tidak ada judul", style: textStyle.defaultTextStyleMedium(fontSize: 14))
          ],
        ),
      ),
    );
  }

  // Category Item
  Widget categoryItem({Color? color, IconData? iconData, String? title, Function()? onPressed}){
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: 80,
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color ?? Colors.lightGreen,
                shape: BoxShape.circle
              ),
              child: Icon(iconData, color: Colors.white, size: 25,),
            ),
            const SizedBox(height: 8),
            AutoSizeText(title ?? "Unknown Category", style: textStyle.defaultTextStyleMedium(fontSize: 11), maxLines: 1, maxFontSize: 13, minFontSize: 11, overflow: TextOverflow.clip, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }

  Widget couponCard({Function()? onPressed, Color? color, int? discount, String? titleDiscount}){
    final size = MediaQuery.of(context).size;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        margin: const EdgeInsets.all(7),
        constraints: BoxConstraints(
            maxWidth: size.width / 1.5,
            minWidth: size.width / 1.6
        ),
        decoration: BoxDecoration(
          color: color ?? GlobalVariable.secondaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AutoSizeText(titleDiscount ?? "Voucher Diskon", style: textStyle.defaultTextStyleMedium(fontSize: 14)),
                const SizedBox(width: 7),
                GestureDetector(
                    onTap: (){},
                    child: const Icon(Bootstrap.info_circle_fill, color: Colors.black, size: 18)
                )
              ],
            ),
            AutoSizeText("Diskon ${discount ?? 0}%", style: textStyle.defaultTextStyleMedium(fontSize: 32)),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: onPressed, label: Text("Ambil Voucher", style: textStyle.defaultTextStyleMedium(color: color ?? GlobalVariable.secondaryColor.withOpacity(0.7))), icon: Icon(Icons.keyboard_arrow_right, color: color ?? GlobalVariable.secondaryColor.withOpacity(0.7)), iconAlignment: IconAlignment.end)
          ],
        ),
      ),
    );
  }
}