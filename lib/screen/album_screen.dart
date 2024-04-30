/*
 * this is Album Screen Page Show All Album Data in page
 */
import 'package:api_calling_task/api_calling/apicalling.dart';
import 'package:flutter/material.dart';

import '../model/album.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  /*
   *Create future List Of Album Model
   */
  late Future<List<Album>> albums;

  @override
  void initState() {
    super.initState();

    getAlbum(); //get album method for call a data into data base
  }

  /*
   * this call ApiCalling class methode for getAllAlbum from url
   *
   * Return Type :-void
   */
  void getAlbum() {
    albums = ApiCalling().getAllAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Albums"),
      ),
      body: FutureBuilder(
          future: albums,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return Card(
                margin: const EdgeInsets.all(15),
                child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.grey,
                        height: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      Album album = snapshot.data![index];

                      return Container(
                        color: Colors.white70,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,

                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/m1.jpg"),
                          ),

                          title: Text(album.title.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: AutofillHints.familyName,
                                  color: Colors.blueAccent)),

                          trailing: Text(
                            "User Id:- ${album.userId}",
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
