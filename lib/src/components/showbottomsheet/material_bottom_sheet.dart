import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

void materialBottomSheet(BuildContext context, {Widget? widget}){
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 5)]
        ),
        child: widget
      );
    },
  );
}