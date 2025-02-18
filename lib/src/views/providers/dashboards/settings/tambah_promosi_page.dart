import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:nyewadotid/src/components/button/cupertino_button.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textformfield/underline_textformfield.dart';

class TambahPromosiPage extends StatefulWidget {
  const TambahPromosiPage({super.key});

  @override
  State<TambahPromosiPage> createState() => _TambahPromosiPageState();
}

class _TambahPromosiPageState extends State<TambahPromosiPage> {
  TextEditingController kodePromosi = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController deskripsi= TextEditingController();
  RxBool selectedPercentage = true.obs;

  DateTime now = DateTime.now();

  String formatedDate(DateTime date){
    return DateFormat('EEEE, dd MMM yyyy').format(date);
  }

  @override
  void initState() {
    kodePromosi.text = "HSODWEIX";
    super.initState();
  }

  @override
  void dispose() {
    kodePromosi.dispose();
    startDate.dispose();
    endDate.dispose();
    deskripsi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: const Text("Tambah Promosi"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            const SizedBox(height: 5),
            SizedBox(
              width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
              child: UnderlineTextformfield(
                controller: startDate,
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now,
                    lastDate: DateTime(now.year, now.month+1, now.hour),
                  );
                  if(pickedDate != null){
                    startDate.text = formatedDate(pickedDate);
                  }
                },
                label: "Tanggal Awal Valid",
                iconData: Icons.first_page,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: orientation == Orientation.portrait ? double.infinity : size.width / 2,
              child: UnderlineTextformfield(
                controller: endDate,
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now,
                    lastDate: DateTime(now.year, now.month+1, now.hour),
                  );
                  if(pickedDate != null){
                    endDate.text = formatedDate(pickedDate);
                  }
                },
                label: "Tanggal Akhir Valid",
                iconData: Icons.last_page,
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
                label: "Deskripsi Promosi",
                iconData: Icons.description_outlined,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: kDefaultCupertinoButton(
          onPressed: (){},
          title: "Submit"
        ),
      ),
    );
  }
}