import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/movie_controller.dart';
import '../model/movie_model.dart';
import 'dimensions.dart';
import 'movie_item_widget.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  final MovieController movieController = Get.find<MovieController>();

  FavoriteMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Obx(
        () {
          if (movieController.favoriteMovies.isEmpty) {
            // Show a message when there are no favorite movies
            return Center(
              child: Text(
                'No favorite movies yet.',
                style: TextStyle(fontSize: Dim.text20),
              ),
            );
          } else {
            // Show the list of favorite movies
            return ListView.builder(
              itemCount: movieController.favoriteMovies.length,
              itemBuilder: (context, index) {
                Movie movie = movieController.favoriteMovies[index];
                return MovieItemWidget(movie: movie);
              },
            );
          }
        },
      ),
    );
  }
}
