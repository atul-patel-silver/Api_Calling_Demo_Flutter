import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get_X-UnNamed_SecondScreen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back(
                    result:"This is Second Screen Data Send After Back Button Pressed"
                );
              },
              child: const Text("back"),
            ),
            Text(Get.arguments),
          ],
        ),
      ),
    );
  }
}
