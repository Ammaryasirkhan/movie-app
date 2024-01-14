import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextion/pages/dimensions.dart';

import '../model/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          movie.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.posterUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.all(Dim.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Release Date: ${movie.releaseDate}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: Dim.width15),
                  Text(
                    'Overview:',
                    style: TextStyle(
                        fontSize: Dim.text26,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    movie.overview,
                    style: TextStyle(
                      fontSize: Dim.text16 * 1.1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
