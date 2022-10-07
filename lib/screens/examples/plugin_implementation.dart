import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PluginImplementation extends StatefulWidget {
  const PluginImplementation({Key? key}) : super(key: key);

  @override
  State<PluginImplementation> createState() => _PluginImplementationState();
}

class _PluginImplementationState extends State<PluginImplementation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          child: const Text("Show me"),
          onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Dialog Title',
              desc: 'Dialog description here.............',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            )..show();
          },
        ),
      )),
    );
  }
}
