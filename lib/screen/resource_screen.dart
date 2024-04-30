import 'package:api_calling_task/model/resource.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  /*
   * Box Object For call Hive methode and store data in hive database and also retrive data from database
   * this resource have a list out resource data in list format
   */
  late Box resources;

  /*
   *override init methode for build screen
   * in function fetch Test box for perform operation
   *
   */
  @override
  void initState() {
    super.initState();
    resources = Hive.box('Test');
  }

  /*
   * override build methode for design a screen
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resource List'),
      ),

      /*
       *Body part with ListView Builder
       */
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          Resource resource = resources.getAt(index)!;

          return ListTile(
            leading: Text(resource.id.toString()),
            title: Text(resource.name.toString()),
            subtitle: Text(resource.year.toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Delete the note when the delete button is pressed.
                resources.deleteAt(index);
                setState(() {}); //build the life cycle of screen
              },
            ),
          );
        },
      ),
    );
  }
}
