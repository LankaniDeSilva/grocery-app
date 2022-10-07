import 'package:flutter/material.dart';
import 'package:grocery_app/custom_widgets/custom_text.dart';
import 'package:grocery_app/screens/examples/state_management/providers/counter_provider.dart';
import 'package:grocery_app/screens/examples/state_management/screen_two.dart';
import 'package:grocery_app/utils/util_function.dart';
import 'package:provider/provider.dart';

class StateManagement extends StatefulWidget {
  const StateManagement({Key? key}) : super(key: key);

  @override
  State<StateManagement> createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
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
                    text: value.counter.toString(),
                    fontSize: 20,
                  );
                },
              ),
              // CustomText(
              //   text: Provider.of<CounterProvider>(context).counter.toString(),
              //   fontSize: 20,
              // ),
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
                UtilFunction.navigator(context, const ScreenTwo());
              },
              child: const CustomText(
                text: 'Go to next screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
