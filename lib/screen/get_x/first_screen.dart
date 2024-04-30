import 'package:api_calling_task/screen/get_x/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Get_X_UnNamed_FirstScreen")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async{
                  /*
                   *Get.off(NextPage())  do not back on previous page
                   * Get.offAll(NextPage())  using this function remove all the previous screen do not back also but using this remove
                   *
                   */
                  var backScreenData=await Get.to(()=> SecondScreen(),
                     duration: const Duration(seconds: 5),
                       transition: Transition.leftToRight,
                       curve:Curves.bounceInOut,arguments: "Hello Unnamed Routing"
                     );


                },
                child: const Text('Go to Screen 2 '),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
