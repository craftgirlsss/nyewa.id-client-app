import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  final textStyle = GlobalTextStyle();
  final bookedCard = BookingCardProvider();
  var menuSelected = 0.obs;
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: GlobalVariable.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Obx(() => ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: menuSelected.value == 0 ? GlobalVariable.secondaryColor.withOpacity(0.2) : Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: isLoading.value ? (){} : () {menuSelected.value = 0;}, child: Text("Upcoming", style: textStyle.defaultTextStyleBold(fontSize: 13, color: menuSelected.value == 0 ? GlobalVariable.secondaryColor : Colors.grey.shade400))))),
                      const SizedBox(width: 5),
                      Expanded(child: Obx(() => ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: menuSelected.value == 1 ? GlobalVariable.secondaryColor.withOpacity(0.2) : Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: isLoading.value ? (){} : () {menuSelected.value = 1;}, child: Text("History", style: textStyle.defaultTextStyleBold(fontSize: 13, color: menuSelected.value == 1 ? GlobalVariable.secondaryColor : Colors.grey.shade400))))),
                      const SizedBox(width: 5),
                      Expanded(child: Obx(() => ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: menuSelected.value == 2 ? GlobalVariable.secondaryColor.withOpacity(0.2) : Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed:  isLoading.value ? (){} : () {menuSelected.value = 2;}, child: Text("Draft", style: textStyle.defaultTextStyleBold(fontSize: 13, color: menuSelected.value == 2 ? GlobalVariable.secondaryColor : Colors.grey.shade400))))),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  if(menuSelected.value == 0){
                    return bookedCard.runningBookings(context, length: 1);
                  }else if(menuSelected.value == 1){
                    return bookedCard.historyBooked(context, length: 2);
                  }else{
                    return bookedCard.draftBook(context);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}