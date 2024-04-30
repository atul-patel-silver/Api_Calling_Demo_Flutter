import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_calling/apicalling.dart';
import '../model/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late Future<List<Todo>> todos;

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  /**
   * this call ApiCalling class methode for getAllTodos from url
   *
   * Return Type :-void
   */
  void getTodos() {
    todos = ApiCalling().getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Todos"),
      ),

      body: FutureBuilder(

          future: todos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return Card(
                margin: EdgeInsets.all(15),
                child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.grey,
                        height: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      Todo todo = snapshot.data![index];

                      return Container(
                        color: Colors.white70,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        child: ListTile(
                          leading: Text(
                            "User Id:- ${todo.userId}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.brown,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          title: Text(todo.title.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: AutofillHints.familyName,
                                  color: Colors.blueAccent)),
                          trailing: Text(
                            "Status:- ${todo.completed}",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const Center(child: Text("No Data Found"));
            }
          }),
    );
  }
}
