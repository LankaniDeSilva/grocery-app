import 'package:flutter/material.dart';
import 'package:grocery_app/screens/examples/state_management/providers/counter_provider.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/custom_text.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false)
                      .increseCounter();
                },
                child: const CustomText(
                  text: '+',
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CounterProvider>(
                builder: (context, value, child) {
                  return CustomText(
                    text: '${value.counter}',
                    fontSize: 20,
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .decreaseCounter();
              },
              child: const CustomText(
                text: '-',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const CustomText(
                text: 'Go Back',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
