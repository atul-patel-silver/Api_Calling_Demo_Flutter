import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveObxScreen extends StatelessWidget {
   ReactiveObxScreen({super.key});

  var count=0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get_X_Reactive_Obx")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=> Text("$count")),
            ElevatedButton(
              onPressed: () {
                count++;
              },
              child: const Text("Counter"),
            ),
          ],
        ),
      ),
    );
  }
}
