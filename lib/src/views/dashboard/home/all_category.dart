import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/components/utilities/utilities.dart';
import 'package:nyewadotid/src/views/dashboard/home/search_page.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final textStyle = GlobalTextStyle();
  final globalVariable = GlobalVariable();
  final utilities = Utilities();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 50,
          titleSpacing: 10,
          title: TextField(
            readOnly: true,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage())),
            onSubmitted: (value) => debugPrint(value),
            decoration: InputDecoration(
              suffixIcon: const Icon(Iconsax.search_normal_outline, color: Colors.black38),
              hintText: "Cari yang anda ingin sewa...",
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
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: utilities.cardTitle(title: "Semua Kategori")
                    ),
                    GridView.count(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          categoryItem(iconData: MingCute.air_condition_open_fill, title: "Service AC", onPressed: (){}),
                          categoryItem(iconData: Icons.speaker, title: "Sound System", color: Colors.deepPurpleAccent, onPressed: (){}),
                          categoryItem(iconData: FontAwesome.tent_solid, title: "Wedding Organizer", color: Colors.yellow.shade700, onPressed: (){}),
                          categoryItem(iconData: Icons.construction_rounded, title: "Alat Konstruksi", color: Colors.blue, onPressed: (){}),
                          categoryItem(iconData: MingCute.music_2_fill, title: "Alat Musik", color: Colors.pink, onPressed: (){}),
                          categoryItem(iconData: Bootstrap.camera_fill, title: "Kamera", color: Colors.orange, onPressed: (){}),

                          categoryItem(iconData: FontAwesome.truck_fast_solid, title: "Truk", color: Colors.indigo, onPressed: (){}),
                          categoryItem(iconData: AntDesign.car_fill, title: "Mobil", color: Colors.amber, onPressed: (){}),
                          categoryItem(iconData: FontAwesome.video_solid, title: "Video Editor", color: Colors.purpleAccent, onPressed: (){}),
                          categoryItem(iconData: Icons.car_repair, title: "Teknisi Kendaraan", color: Colors.blue.shade700, onPressed: (){}),
                          categoryItem(iconData: MingCute.broom_fill, title: "Cleaning Service", color: Colors.pink, onPressed: (){}),
                          categoryItem(iconData: Icons.electric_bolt_outlined, title: "Instalasi Listrik", color: Colors.green.shade800, onPressed: (){}),
                          categoryItem(iconData: Iconsax.home_2_bold, title: "Tukang Bangunan", color: Colors.orange, onPressed: (){}),
                          categoryItem(iconData: MingCute.menu_line, title: "Lainnya", color: Colors.orange, onPressed: (){}),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }

  // Category Item
  Widget categoryItem({Color? color, IconData? iconData, String? title, Function()? onPressed}){
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: 90,
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
            AutoSizeText(title ?? "Unknown Category", style: textStyle.defaultTextStyleMedium(), maxLines: 2, maxFontSize: 13, minFontSize: 11, overflow: TextOverflow.clip, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
