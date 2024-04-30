import 'package:api_calling_task/model/comment.dart';

import 'package:flutter/material.dart';

import '../api_calling/apicalling.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late Future<List<Comment>> comments;

  @override
  void initState() {
    super.initState();
    getComments();
  }

  /*
   *get comment from apicalling class method and this methode call remote server api
   */
  void getComments() {
    comments = ApiCalling().getAllComment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Comments"),
      ),
      body: FutureBuilder(
          future: comments,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return Card(
                child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      Comment comment = snapshot.data![index];

                      return SizedBox(
                        width: double.infinity,
                        child: ListTile(
                          leading: Text(
                            comment.id.toString(),
                          ),
                          title: Text(comment.name.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: AutofillHints.familyName,
                                  color: Colors.blueAccent)),
                          subtitle: Text(comment.body.toString()),
                          trailing: Text(
                            comment.email.toString(),
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
