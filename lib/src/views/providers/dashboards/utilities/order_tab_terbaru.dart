import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/views/utilities/booking_card.dart';

class OrderTabTerbaruProvider extends StatefulWidget {
  const OrderTabTerbaruProvider({super.key});

  @override
  State<OrderTabTerbaruProvider> createState() => _OrderTabTerbaruProviderState();
}

class _OrderTabTerbaruProviderState extends State<OrderTabTerbaruProvider> {
  BookingCardProvider bookingCardProvider = BookingCardProvider();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TimeOfDay startJob = TimeOfDay(hour: now.hour-4, minute: 0);
    TimeOfDay endJob = TimeOfDay(hour: now.hour+4, minute: 0);
    return Scrollbar(
      child: RefreshIndicator(
        color: GlobalVariable.secondaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          debugPrint("Refreshed");
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(1, (i){
              return bookingCardProvider.cardItemBookedProvider(
                context,
                customerMessage: "Pak, tolong benai genteng saya",
                customerName: "Jesselin Susanto",
                bookedID: "HS83HKAX",
                startTime: startJob,
                endTime: endJob,
                latitude: -7.4381946,
                longitude: 112.7329765,
                onPressedGetOrder: (){},
                onPressedRejectOrder: (){},
                titleBooked: "Sewa Jasa Tukang Bangunan",
                urlImageCustomer: "https://media.licdn.com/dms/image/v2/D5603AQH0bkz9f0VNXg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1728708120132?e=1745452800&v=beta&t=hy0GHhAgsEIVT-3hOh_br_AGvFI6ZH3YtgaL7_ekxqI",
                customerLocation: "Blok M No., Jl. Perum Jenggolo Asri No.1, Prapatan, Pagerwojo, Kec. Sidoarjo, Kabupaten Sidoarjo, Jawa Timur 61252"
              );
            }),
          ),
        ),
      ),
    );
  }
}