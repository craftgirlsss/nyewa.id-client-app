import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/views/providers/dashboards/orders/detail_order_provider.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class OrderTabDoneProvider extends StatefulWidget {
  const OrderTabDoneProvider({super.key});

  @override
  State<OrderTabDoneProvider> createState() => _OrderTabDoneProviderState();
}

class _OrderTabDoneProviderState extends State<OrderTabDoneProvider> {
  BookingCardProvider bookingCardProvider = BookingCardProvider();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TimeOfDay startJob = TimeOfDay(hour: now.hour-4, minute: 0);
    TimeOfDay endJob = TimeOfDay(hour: now.hour+4, minute: 0);
    return RefreshIndicator(
      color: GlobalVariable.secondaryColor,
      backgroundColor: Colors.white,
      onRefresh: () async {
        debugPrint("Refreshed");
      },
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: List.generate(3, (i){
              return bookingCardProvider.cardItemBookedProvider(
                context,
                bookedID: "H3XSM8SK",
                titleBooked: "Sewa Jasa Tukang Bangunan",
                statusBooked: 1,
                startTime: startJob,
                endTime: endJob,
                onPressed: (){
                  Get.to(() => const DetailOrderProvider(orderID: "#H3XSM8SK"));
                },
                customerName: "Arum Purwita Sari",
                customerLocation: "Jalan Telaga, Kemiri, Sidoarjo",
                customerMessage: "Rumah saya bengkel truk ya pak depan nya.",
                urlImageCustomer: "https://media.licdn.com/dms/image/v2/D4D03AQHPzZ-BTu1GDg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1676364504845?e=1745452800&v=beta&t=ODzB298O7chuyo1jdxKmwPTOUzrObJzMumrrQm01BIw"
              );
            }),
          ),
        ),
      ),
    );
  }
}