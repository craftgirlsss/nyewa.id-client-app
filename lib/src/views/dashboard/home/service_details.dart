import 'package:flutter/material.dart';

class ServiceDetails extends StatefulWidget {
  final String? serviceName;
  final String? serviceID;
  final String? urlImage;
  const ServiceDetails({super.key, this.serviceName, this.serviceID, this.urlImage});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.serviceName ?? "Unknown Service Name"),
      ),
      body: Stack(
        children: [
          Image.asset(widget.urlImage ?? "", errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 30, color: Colors.redAccent)),
          Positioned(
            top: 50,
            child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
