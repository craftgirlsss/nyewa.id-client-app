import 'package:flutter/material.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class OrderTabTerbaru extends StatefulWidget {
  const OrderTabTerbaru({super.key});

  @override
  State<OrderTabTerbaru> createState() => _OrderTabTerbaruState();
}

class _OrderTabTerbaruState extends State<OrderTabTerbaru> {
  BookingCardProvider bookingCardProvider = BookingCardProvider();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(1, (i){
            return bookingCardProvider.notAvailableBooked();
          }),
        ),
      ),
    );
  }
}