import 'package:flutter/material.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class OrderTabRuning extends StatefulWidget {
  const OrderTabRuning({super.key});

  @override
  State<OrderTabRuning> createState() => _OrderTabRuningState();
}

class _OrderTabRuningState extends State<OrderTabRuning> {
  BookingCard bookingCard = BookingCard();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(3, (i){
          return bookingCard.runningBookings(context, length: 1);
        }),
      ),
    );
  }
}