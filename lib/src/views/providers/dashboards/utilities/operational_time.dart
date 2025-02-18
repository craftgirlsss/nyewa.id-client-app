import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/button/cupertino_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/utilities/utilities.dart';
import 'package:nyewadotid/src/helpers/main_global_variable.dart';

class OperationalTime extends StatefulWidget {
  const OperationalTime({super.key, this.fromSettings});
  final bool? fromSettings;

  @override
  State<OperationalTime> createState() => _OperationalTimeState();
}

class _OperationalTimeState extends State<OperationalTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: const Text("Atur Jam Operasional"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: kDefaultCupertinoTextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              textColor: GlobalVariable.secondaryColor,
              title: "Simpan"
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: List.generate(MainGlobalVariable.hariBuka.length, (i){
            return SchedulePicker(
              dayName: MainGlobalVariable.hariBuka[i],
            );
          }),
        ),
      ),
    );
  }
}