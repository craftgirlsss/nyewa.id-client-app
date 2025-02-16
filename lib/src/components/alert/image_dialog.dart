import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/global/index.dart';

class ImageDialog extends StatelessWidget {
  final String? urlImage;
  const ImageDialog({super.key, this.urlImage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width - 50,
        height: size.width - 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: urlImage != null ? NetworkImage(urlImage!) : const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) => const Icon(CupertinoIcons.photo, size: 30, color: GlobalVariable.secondaryColor),
          )
        ),
      ),
    );
  }
}