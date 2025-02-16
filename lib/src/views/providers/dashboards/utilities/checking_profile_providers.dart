import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/button/elevated_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/showbottomsheet/cupertino_bottom_sheet.dart';
import 'package:nyewadotid/src/components/textformfield/underline_textformfield.dart';
import 'package:nyewadotid/src/helpers/generate_random_token.dart';
import 'package:nyewadotid/src/helpers/main_global_variable.dart';

class CheckingProfileProviders extends StatefulWidget {
  const CheckingProfileProviders({super.key});

  @override
  State<CheckingProfileProviders> createState() => _CheckingProfileProvidersState();
}

class _CheckingProfileProvidersState extends State<CheckingProfileProviders> {
  final _formKey = GlobalKey<FormState>();
  RxList fotoUsaha = [].obs;
  RxList jamOperasional = [].obs;
  RxInt selectedJenisBisnisIndex = 0.obs;
  RxBool isLoading = false.obs;
  TextEditingController namaUsaha = TextEditingController();
  TextEditingController jenisUsaha = TextEditingController();
  TextEditingController tipeBiaya = TextEditingController();
  TextEditingController biaya = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController kodePromosi = TextEditingController();

  @override
  void initState() {
    kodePromosi.text = getRandomString(8);
    super.initState();
  }

  @override
  void dispose() {
    namaUsaha.dispose();
    tipeBiaya.dispose();
    biaya.dispose();
    deskripsi.dispose();
    kodePromosi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          title: const Text("Lengkapi Profil Provider"),
          actions: [
            CupertinoButton(
              onPressed: (){},
              child: const Icon(CupertinoIcons.info, color: GlobalVariable.secondaryColor),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey ,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                    child: UnderlineTextformfield(
                      controller: namaUsaha,
                      keyboardType: TextInputType.name,
                      label: "Nama Bisnis",
                      iconData: Bootstrap.shop,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                    child: UnderlineTextformfield(
                      controller: jenisUsaha,
                      label: "Jenis Usaha",
                      iconData: Bootstrap.shop_window,
                      readOnly: true,
                      onTap: (){
                        CustomCupertinoBottomSheet.cupertinoModalPopupsPicker(context,
                          widget: Obx(() => isLoading.value 
                            ? const SizedBox() 
                            : CupertinoPicker(
                                magnification: 1.22,
                                squeeze: 1.2,
                                useMagnifier: true,
                                itemExtent: CustomCupertinoBottomSheet.kItemExtent,
                                scrollController: FixedExtentScrollController(initialItem: selectedJenisBisnisIndex.value),
                                onSelectedItemChanged: (int selectedItem) {
                                  selectedJenisBisnisIndex.value = selectedItem;
                                  jenisUsaha.text = MainGlobalVariable.jenisBisnis[selectedItem];
                                },
                                children: List<Widget>.generate(MainGlobalVariable.jenisBisnis.length, (int index) {
                                  return Center(child: Text(MainGlobalVariable.jenisBisnis[index]));
                                }
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                    child: UnderlineTextformfield(
                      controller: tipeBiaya,
                      label: "Tipe Biaya Layanan",
                      iconData: EvaIcons.pricetags_outline,
                      readOnly: true,
                      onTap: (){
                        CustomCupertinoBottomSheet.cupertinoModalPopupsActionSheet(context,
                          widget: CupertinoActionSheet(
                            cancelButton: CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              isDefaultAction: true,
                              onPressed: () => Navigator.pop(context), child: const Text("Batal")
                            ),
                            actions: List.generate(MainGlobalVariable.listTipeBiaya.length, (i){
                              return CupertinoActionSheetAction(
                                onPressed: (){
                                  tipeBiaya.text = MainGlobalVariable.listTipeBiaya[i];
                                  Navigator.pop(context);
                                }, 
                                child: Text(MainGlobalVariable.listTipeBiaya[i])
                              );
                            }),  
                          )
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                    child: UnderlineTextformfieldCurrency(
                      controller: biaya,
                      label: "Biaya",
                      iconData: EvaIcons.pricetags_outline,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                    child: UnderlineTextformfield(
                      controller: deskripsi,
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      label: "Deskripsi Usaha",
                      iconData: Icons.description_outlined,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
                    child: UnderlineTextformfield(
                      controller: kodePromosi,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      addCopyAction: true,
                      label: "Kode Promosi",
                      iconData: MingCute.coupon_line,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: kDefaultElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){

              }
            },
            title: "Submit"
          )
        ),
      ),
    );
  }
}