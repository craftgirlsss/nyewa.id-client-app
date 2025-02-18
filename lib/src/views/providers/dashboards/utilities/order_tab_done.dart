import 'package:flutter/material.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class OrderTabDone extends StatefulWidget {
  const OrderTabDone({super.key});

  @override
  State<OrderTabDone> createState() => _OrderTabDoneState();
}

class _OrderTabDoneState extends State<OrderTabDone> {
  BookingCard bookingCard = BookingCard();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(3, (i){
          return bookingCard.historyBooked(context, length: 1);
        }),
      ),
    );
  }
}