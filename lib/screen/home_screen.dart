import 'package:api_calling_task/api_calling/apicalling.dart';
import 'package:api_calling_task/screen/album_screen.dart';
import 'package:api_calling_task/screen/get_x/first_screen.dart';
import 'package:api_calling_task/screen/photo_screen.dart';
import 'package:api_calling_task/screen/post_screen.dart';
import 'package:api_calling_task/screen/comment_screen.dart';
import 'package:api_calling_task/screen/resource_screen.dart';
import 'package:api_calling_task/screen/todo_screen.dart';
import 'package:api_calling_task/screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  String name = '';
  String job = '';

  /*
   * this function call add resource function from ApiCalling Class
   * in this function implement a Hive Database Functionality
   */
  void addResources() {
    ApiCalling().addResources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/profile1.jpg'), // Add Profile Image from Asset Folder
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            //This List Tile For Post Navigator
            ListTile(
              title: const Text('Posts'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostScreen()),
                );
              },
            ),
            //This List Tile For Comment Navigator
            ListTile(
              title: const Text('Comments'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommentScreen()),
                );
              },
            ),
            //This List Tile For Albums Navigator
            ListTile(
              title: const Text('Albums'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlbumScreen()),
                );
              },
            ),
            //This List Tile For Photos Navigator
            ListTile(
              title: const Text('Photos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PhotoScreen()),
                );
              },
            ),
            //This List Tile For Todos Navigator
            ListTile(
              title: const Text('Todos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TodoScreen()),
                );
              },
            ),
            //This List Tile For Users Navigator
            ListTile(
              title: const Text('Users'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserScreen()),
                );
              },
            ),
            //This List Tile For Add Resources Navigator
            ListTile(
              title: const Text('Add Resources'),
              trailing: ElevatedButton(
                onPressed: addResources,
                child: const Text(
                  '+',
                ),
              ),
            ),
            //This List Tile For Show Resources Navigator
            ListTile(
              title: const Text('Show Resources'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResourceScreen()),
                );
              },
            ),

            const Divider(
              height: 10,
              color: Colors.indigoAccent,
            ),

            ListTile(
              title: const Text('GetX Screen Unnamed Routing'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstScreen()),
                );
              },
            ),


            ListTile(
              title: const Text('GetX Screen Named Routing'),
              onTap: () {
                Get.toNamed("/third");
              },
            ),

            ListTile(
              title: const Text('GetX Screen Named Routing'),
              onTap: () {
                Get.toNamed("/reactiveobxscreen");
              },
            ),





          ],
        ),
      ),
      //Body part
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: jobController,
              decoration: const InputDecoration(
                labelText: 'Job',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  job = jobController.text;
                });
                // You can perform further actions with the entered data here
              },
              child: const Text('Save'),
            ),

            const SizedBox(height: 16.0),

            Text("Name:- $name" ,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 9.0),
            Text("Job:- $job" ,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
