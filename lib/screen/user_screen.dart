import 'package:api_calling_task/api_calling/apicalling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() {
    users = ApiCalling().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Users", style: TextStyle(fontSize: 20)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<User>>(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<User>? users = snapshot.data;
                return ListView.builder(
                  itemCount: users?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${users?[index].name.toString()}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Username: ${users?[index].username}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Email: ${users?[index].email}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Address: ${users?[index].address?.street}, ${users?[index].address?.suite}, ${users?[index].address?.city}, ${users?[index].address?.zipcode}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Phone: ${users?[index].phone}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Website: ${users?[index].website}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Company: ${users?[index].company?.name}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
