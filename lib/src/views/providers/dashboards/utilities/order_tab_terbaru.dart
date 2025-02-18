import 'package:flutter/material.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class OrderTabTerbaru extends StatefulWidget {
  const OrderTabTerbaru({super.key});

  @override
  State<OrderTabTerbaru> createState() => _OrderTabTerbaruState();
}

class _OrderTabTerbaruState extends State<OrderTabTerbaru> {
  BookingCard bookingCard = BookingCard();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(1, (i){
          return bookingCard.notAvailableBooked();
        }),
      ),
    );
  }
}