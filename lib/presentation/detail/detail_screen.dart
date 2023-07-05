import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app_practice/domain/model/photo.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;
  const DetailScreen({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Image'),
      ),
      body: GestureDetector(
        onTap: () {
          context.pop('/main');
        },
        child: Hero(
          tag: photo.id,
          child: Image.network(
            photo.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
