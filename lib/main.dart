import 'dart:io';

import 'package:api_calling_task/screen/get_x/fourth_screen.dart';
import 'package:api_calling_task/screen/get_x/reactive_obx_screen.dart';
import 'package:api_calling_task/screen/get_x/third_screen.dart';
import 'package:api_calling_task/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'model/resource.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(ResourceAdapter());
  Hive.openBox('Test');
  Hive.openBox('User');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.leftToRight,
        getPages: [
          GetPage(name: "/third", page:()=> const ThirdScreen()),
          GetPage(name: "/fourth", page:()=> const FourthScreen()),
          GetPage(name: "/reactiveobxscreen", page:()=> ReactiveObxScreen())
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
