/**
 * Photo Screen Page
 */

import 'package:api_calling_task/model/Photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api_calling/apicalling.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  late Future<List<Photo>> photos;

  @override
  void initState() {
    super.initState();
    getPhotos();
  }

  /**
   * this call ApiCalling class methode for getAllPhotos from url
   *
   * Return Type :-void
   */
  void getPhotos() {
    photos = ApiCalling().getAllPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("All Photo"),
      ),

      body: FutureBuilder(

          future: photos,
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
                      Photo photo = snapshot.data![index];

                      return Container(
                        color: Colors.white70,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage("${photo.url}"),
                          ),
                          title: Text(photo.title.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: AutofillHints.familyName,
                                  color: Colors.blueAccent)),
                          trailing: Text(
                            "Album Id:- ${photo.albumId}",
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
