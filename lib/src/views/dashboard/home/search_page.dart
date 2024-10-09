import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';
import 'package:nyewadotid/src/components/textsyle/index.dart';
import 'package:nyewadotid/src/helpers/currency_formator.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final textStyle = GlobalTextStyle();
  final globalVariable = GlobalVariable();
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 50,
          titleSpacing: 10,
          title: TextField(
            autofocus: true,
            onSubmitted: (value) => debugPrint(value),
            decoration: InputDecoration(
              suffixIcon: const Icon(CupertinoIcons.placemark, color: Colors.black38),
              hintText: "Cari yang terdekat saya...",
              hintStyle: textStyle.defaultTextStyleMedium(color: Colors.black38),
              filled: true,
              fillColor: Colors.grey.shade50,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: Colors.black12, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: Colors.black12, width: 0.5),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              // Highliht Products
              Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: globalVariable.secondaryColor
                          ),
                        ),
                        const SizedBox(width: 8),
                        AutoSizeText("Highlight Services", style: textStyle.defaultTextStyleMedium(), minFontSize: 16, maxFontSize: 17, maxLines: 1, overflow: TextOverflow.clip)
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          cardProductForSearch(onPressed: (){}, title: "Ireng Sound System", urlImage: "assets/images/sound.jpg", price: 600000, ratingPoint: 4.5, review: 12, locationOfficeService: "Masangan Kulon, Sukodono, Sidoarjo"),
                          cardProductForSearch(onPressed: (){}, title: "Klin Klin Sidoarjo", urlImage: "assets/images/cleaning.jpg", price: 300000, ratingPoint: 4.8, review: 89, locationOfficeService: "Masangan Kulon, Sukodono, Sidoarjo"),
                          cardProductForSearch(onPressed: (){}, title: "Barokah Jaya Tenda", urlImage: "assets/images/tenda.jpg", price: 1200000, ratingPoint: 4.4, review: 18, locationOfficeService: "Masangan Kulon, Sukodono, Sidoarjo"),
                        ],
                        // children: List.generate(3, (i) {
                        //   return cardProductForSearch(onPressed: (){});
                        // }),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardProductForSearch({Function()? onPressed, String? title, double? ratingPoint, int? review, int? price, String? urlImage, String? locationOfficeService}){
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26, width: 0.3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(urlImage ?? 'assets/images/kapal.jpg'), fit: BoxFit.cover, onError: (exception, stackTrace) => const Icon(Bootstrap.box, size: 30))
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Bootstrap.star_fill, color: Colors.orange, size: 15),
                            const SizedBox(width: 5),
                            Text(ratingPoint == 0 || ratingPoint == null ? "0.0" : "$ratingPoint", style: textStyle.defaultTextStyleBold()),
                            const SizedBox(width: 5),
                            Text(review == 0 || review == null ? "(0)" : "($review)", style: textStyle.defaultTextStyleMedium(color: Colors.black54, fontSize: 13)),
                          ],
                        ),
                        AutoSizeText(title ?? "No Title", style: textStyle.defaultTextStyleMedium(color: Colors.black), maxLines: 2, maxFontSize: 17, minFontSize: 16),
                        AutoSizeText(locationOfficeService ?? "No available location", style: textStyle.defaultTextStyleMedium(color: Colors.black45), maxLines: 2, maxFontSize: 13, minFontSize: 12),
                        // AutoSizeText("Start From", style: textStyle.defaultTextStyleMedium(color: Colors.black45), maxLines: 2, maxFontSize: 15, minFontSize: 14),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green
                          ),
                          child: Text(price == 0 || price == null ? "Rp. 0 / hari" : "${formatCurrencyId.format(price)} / hari", style: textStyle.defaultTextStyleMedium(color: Colors.white)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: (){},
                    child: const Icon(Bootstrap.three_dots_vertical, color: Colors.black, size: 18)),
              ],
            )
          ],
        ),
      ),
    );
  }
}