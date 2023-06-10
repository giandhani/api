import 'dart:convert';

import 'dart:io';

import 'package:api/models/comment.dart';
import 'package:api/models/post.dart';
import 'package:api/services/post_services.dart';
import 'package:api/models/album.dart';
import 'package:api/models/photo.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostServices().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
            jsonData.length,
            (index) => Post.fromMap(
                  jsonData[index],
                ));
      } else {
        throw Exception();
      }
    });
  }

  Future<List<Comment>> fetchComment(int id) async {
    return await PostServices().fetchComments(id).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
            jsonData.length, (index) => Comment.fromMap(jsonData[index]));
      } else {
        throw Exception();
      }
    });
  }

  Future<List<Album>> fetchAlbums(int id) async {
    return await PostServices().fetchAlbums(id).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => Album.fromMap(jsonData[index]),
        );
      } else {
        throw Exception();
      }
    });
  }

  Future<List<Photo>> fetchPhotos(int id) async {
    return await PostServices().fetchPhotos(id).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => Photo.fromMap(jsonData[index]),
        );
      } else {
        throw Exception();
      }
    });
  }

  Future<bool> delete(int id) async {
    return await PostServices().delete(id).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> create(Post post) async {
    return await PostServices().create(post).then((res) {
      if (res.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> patch(Post post) async {
    return await PostServices()
        .patch(id: post.id, tittle: post.title, body: post.body)
        .then((res) {
      if (res.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    });
  }
}
