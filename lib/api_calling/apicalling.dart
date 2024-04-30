/*
this class is provide a functionality to call api call
 */

import 'package:api_calling_task/model/Photo.dart';
import 'package:api_calling_task/model/post.dart';
import 'package:api_calling_task/model/comment.dart';
import 'package:api_calling_task/model/album.dart';
import 'package:api_calling_task/model/resource.dart';
import 'package:api_calling_task/model/todo.dart';
import 'package:api_calling_task/model/user.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class ApiCalling {
  final Box dataBox = Hive.box('Test');

  /*Dio Class Object For Api Calling and
               mention a base url  in constructor caling time*/

  final dio =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  /*
   * This function get All Post From Url And return a list out Posts
   * do not take any parameter in function
   *   Return Type:-List<Posts>
   */

  Future<List<Post>> getAllPost() async {
    List<Post> posts = [];
    try {
      var response = await dio.get("posts");
      for (var post in response.data) {
        posts.add(Post.fromJson(post));
      }
    } catch (e) {
      print(e);
    }

    return posts;
  }

  /*
  This function get All Comment  From Url And return a list out of Comments
    do not take any parameter in function

    Return Type:-List<Comment>
   */

  Future<List<Comment>> getAllComment() async {
    List<Comment> comments = [];
    try {
      var response = await dio.get("comments");
      for (var comment in response.data) {
        comments.add(Comment.fromJson(comment));
      }
    } catch (e) {
      print(e);
    }

    return comments;
  }

/*
  This function get All Albums  From Url And return a list out of Albums
    do not take any parameter in function

    Return Type:-List<Album>
   */

  Future<List<Album>> getAllAlbums() async {
    List<Album> albums = [];
    try {
      var response = await dio.get("albums");
      for (var album in response.data) {
        albums.add(Album.fromJson(album));
      }
    } catch (e) {
      print(e);
    }
    return albums;
  }

  /*
  This function get All Photos  From Url And return a list out of Photos
    do not take any parameter in function

    Return Type:-List<Album>
   */

  Future<List<Photo>> getAllPhotos() async {
    List<Photo> photos = [];
    try {
      var response = await dio.get("photos");
      for (var photo in response.data) {
        photos.add(Photo.fromJson(photo));
      }
    } catch (e) {
      print(e);
    }
    return photos;
  }

  /*
  This function get All Todos  From Url And return a list out of Todos
    do not take any parameter in function

    Return Type:-List<Todo>
   */

  Future<List<Todo>> getAllTodos() async {
    List<Todo> todos = [];
    try {
      var response = await dio.get("todos");
      for (var todo in response.data) {
        todos.add(Todo.fromJson(todo));
      }
    } catch (e) {
      print(e);
    }
    return todos;
  }

  /*
  This function get All Users  From Url And return a list out of getAllUsers
    do not take any parameter in function

    Return Type:-List<User>
   */

  Future<List<User>> getAllUsers() async {
    List<User> users = [];
    try {
      var response = await dio.get("users");
      for (var user in response.data) {
        users.add(User.fromJson(user));
      }
    } catch (e) {
      print(e);
    }
    return users;
  }

/*
  This function Add Resources  From Url
    do not take any parameter in function

    Return Type:-void
   */

  void addResources() async {
    List<Resource> resources = [];
    try {
      var response = await Dio().get("https://reqres.in/api/unknown");

      List<dynamic> dataList = response.data['data'];

      resources = dataList.map((data) => Resource.fromJson(data)).toList();

      //add List In Hive DataBase
      addResourceInHiveDatabase(resources);
    } catch (e) {
      print(e);
    }
  }

  void addResourceInHiveDatabase(resources) {
    try {
      for (var resource in resources) {
        dataBox.add(resource);
      }
    } catch (e) {
      print(e);
    }
  }
}
