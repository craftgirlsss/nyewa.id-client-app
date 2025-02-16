import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/global/index.dart';

class CheckingProfileProviders extends StatefulWidget {
  const CheckingProfileProviders({super.key});

  @override
  State<CheckingProfileProviders> createState() => _CheckingProfileProvidersState();
}

class _CheckingProfileProvidersState extends State<CheckingProfileProviders> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Lengkapi Profil Provider"),
        actions: [
          CupertinoButton(
            onPressed: (){},
            child: const Icon(CupertinoIcons.info, color: GlobalVariable.secondaryColor),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}