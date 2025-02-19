import 'package:flutter/material.dart';

class DetailOrderProvider extends StatefulWidget {
  const DetailOrderProvider({super.key, this.orderID});
  final String? orderID;

  @override
  State<DetailOrderProvider> createState() => _DetailOrderProviderState();
}

class _DetailOrderProviderState extends State<DetailOrderProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Text("Detail Order ${widget.orderID}"),
      ),
    );
  }
}