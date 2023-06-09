import 'dart:convert';
import 'dart:io';

import 'package:api/models/post.dart';
import 'package:api/services/post_services.dart';

class PostController {
  Future<List<Post>> fetchAll() async {
    return await PostServices().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonBody = jsonDecode(res.body);
        return List.generate(
            jsonBody.lenght,
            (index) => Post.fromMap(
                  jsonBody[index],
                ));
      } else {
        throw Exception();
      }
    });
  }
}
