import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/button/cupertino_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/helpers/main_global_variable.dart';

void showPrivacy(BuildContext context, {bool? wasChecked}){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(Iconsax.info_circle_bold, size: 50, color: GlobalVariable.secondaryColor),
                  const DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                    child: Text("INFORMASI")),
                  const SizedBox(height: 20),
                  DefaultTextStyle(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    child: Text(MainGlobalVariable.privacyPolicy, textAlign: TextAlign.justify, selectionColor: Colors.blue,),
                  ),
                  Center(
                    child: kDefaultCupertinoButton(
                      onPressed: () => Navigator.pop(context),
                      title: "Kembali"
                    )
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }