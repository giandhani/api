import 'package:api/cotrollers/post_controller.dart';
import 'package:api/models/post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController postController = PostController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: postController.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            snapshot.data![index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            snapshot.data![index].body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: size.height * 0.0005,
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return Text("Tidak Ada data");
              }
            } else {
              return Text("error");
            }
          },
        ),
      ),
    );
  }
}
