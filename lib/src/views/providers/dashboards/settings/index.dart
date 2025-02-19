import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/listtile/menu_listtile.dart';
import 'package:nyewadotid/src/components/utilities/utilities.dart';
import 'package:nyewadotid/src/views/providers/dashboards/settings/tambah_promosi_page.dart';
import 'package:nyewadotid/src/views/providers/dashboards/utilities/operational_time.dart';

class SettingsProvider extends StatefulWidget {
  const SettingsProvider({super.key});

  @override
  State<SettingsProvider> createState() => _SettingsProviderState();
}

class _SettingsProviderState extends State<SettingsProvider> {
  RxString profileURL = "".obs;
  RxBool isLoading = false.obs;
  
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              pinned: true,
              scrolledUnderElevation: 0,
              stretchTriggerOffset: 200,
              expandedHeight: 100.0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                title: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Obx(() => isLoading.value 
                ? const SizedBox() 
                : Utilities.profilePhoto(
                  urlPhoto: profileURL.value == "" ? null : profileURL.value,
                  onPressed: (){
                    pickImageFromGalleryForProfile();
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("Nama Toko", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: GlobalVariable.secondaryColor)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Bisnis Anda", style: TextStyle(fontWeight: FontWeight.bold, color: GlobalVariable.secondaryColor))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GlobalVariable.secondaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    MenuListtile.menuListtile(
                      onPressed: (){},
                      menuName: "Edit Profil Usaha",
                      leadingIcon: Bootstrap.shop_window
                    ),
                    MenuListtile.menuListtile(
                      onPressed: (){
                        Get.to(() => const TambahPromosiPage());
                      },
                      menuName: "Tambah Promosi Layanan",
                      leadingIcon: MingCute.coupon_line
                    ),
                    MenuListtile.menuListtile(
                      onPressed: (){
                        Get.to(() => const OperationalTime(fromSettings: true));
                      },
                      menuName: "Ubah Jam Operasional Layanan",
                      leadingIcon: CupertinoIcons.clock,
                    ),
                    MenuListtile.menuListtile(
                      onPressed: (){},
                      menuName: "Keluar",
                      isLastMenu: true,
                      leadingIcon: Iconsax.logout_1_outline
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Bantuan Teknis", style: TextStyle(fontWeight: FontWeight.bold, color: GlobalVariable.secondaryColor))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: GlobalVariable.secondaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    MenuListtile.menuListtile(
                      onPressed: (){},
                      menuName: "Chat Support",
                      leadingIcon: Iconsax.support_outline
                    ),
                    MenuListtile.menuListtile(
                      onPressed: (){},
                      menuName: "Laporkan Bug",
                      leadingIcon: Clarity.bug_line
                    ),
                    MenuListtile.menuListtile(
                      onPressed: (){},
                      menuName: "Kebijakan Privasi",
                      isLastMenu: true,
                      leadingIcon: CupertinoIcons.info_circle
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  File? imageGallery;
  File? imageCamera;
  RxString imagePath = "".obs;
  Future<void> pickImageFromGalleryForProfile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    if(imagePicked != null){
      imageGallery = File(imagePicked.path);
      profileURL.value = imagePicked.path;
    }else{
      debugPrint("Image kosong");
    }
  }
}