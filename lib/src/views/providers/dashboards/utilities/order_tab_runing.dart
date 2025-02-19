import 'package:flutter/material.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class OrderTabRuning extends StatefulWidget {
  const OrderTabRuning({super.key});

  @override
  State<OrderTabRuning> createState() => _OrderTabRuningState();
}

class _OrderTabRuningState extends State<OrderTabRuning> {
  BookingCardProvider bookingCardProvider = BookingCardProvider();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TimeOfDay startJob = TimeOfDay(hour: now.hour-4, minute: 0);
    TimeOfDay endJob = TimeOfDay(hour: now.hour+4, minute: 0);
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          children: List.generate(1, (i){
            return bookingCardProvider.cardItemBookedProvider(
              context,
              bookedID: "H3XSM8SK",
              titleBooked: "Sewa Jasa Tukang Bangunan",
              statusBooked: 2,
              startTime: startJob,
              endTime: endJob,
              onPressedPesan: (){},
              onPressed: (){},
              customerName: "Arum Purwita Sari",
              customerLocation: "Jalan Telaga, Kemiri, Sidoarjo",
              customerMessage: "Rumah saya bengkel truk ya pak depan nya.",
              urlImageCustomer: "https://media.licdn.com/dms/image/v2/D4D03AQHPzZ-BTu1GDg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1676364504845?e=1745452800&v=beta&t=ODzB298O7chuyo1jdxKmwPTOUzrObJzMumrrQm01BIw"
            );
          }),
        ),
      ),
    );
  }
}