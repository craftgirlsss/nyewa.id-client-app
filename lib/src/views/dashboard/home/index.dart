import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textStyle = GlobalTextStyle();
  final globalVariable = GlobalVariable();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      categoryItem(iconData: MingCute.air_condition_fill, title: "Service AC"),
                      categoryItem(iconData: MingCute.tent_fill, color: Colors.blue, title: "Tenda Nikah"),
                      categoryItem(iconData: Bootstrap.speaker_fill, color: Colors.deepOrangeAccent, title: "Sound System"),
                      categoryItem(iconData: Bootstrap.arrow_right, color: Colors.deepPurpleAccent, title: "Lihat Semua"),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Shortcut Trending Item
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
                              AutoSizeText("Cleaning Service", style: textStyle.defaultTextStyleMedium(), minFontSize: 16, maxFontSize: 17, maxLines: 1, overflow: TextOverflow.clip)
                            ],
                          ),
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
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            cardItem()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Voucher Box
                // Container(
                //   width: size.width,
                //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20)
                //   ),
                //   child: SingleChildScrollView(
                //     physics: const BouncingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       children: [
                //       ],
                //     ),
                //   ),
                // ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Container Card Item
  Widget cardItem({int? priceOff}){
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/background.png', fit: BoxFit.cover)
              ),
              if(priceOff != null || priceOff == 0)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: globalVariable.secondaryColor
                    ),
                    child: Text("10% OFF", style: textStyle.defaultTextStyleMedium(color: Colors.white)),
                  )
                )
            ],
          ),
        ),
      ],
    );
  }

  // Category Item
  Widget categoryItem({Color? color, IconData? iconData, String? title}){
    return Container(
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
            child: Icon(iconData, color: Colors.white),
          ),
          const SizedBox(height: 8),
          AutoSizeText(title ?? "Unknown Category", style: textStyle.defaultTextStyleMedium(fontSize: 11), maxLines: 1, maxFontSize: 13, minFontSize: 11, overflow: TextOverflow.clip, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
