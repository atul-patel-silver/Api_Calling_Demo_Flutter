import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get_X_Named_SecondScreen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Get.parameters["a"]??""),
            ElevatedButton(
              onPressed: () {
              Get.back();
              },
              child: const Text("back"),
            ),
          ],
        ),
      ),
    );
  }
}
