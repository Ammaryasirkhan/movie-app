import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/movie_controller.dart';
import '../model/movie_model.dart';
import '../model/movie_services.dart';
import 'dimensions.dart';
import 'fav_movie.dart';
import 'movie_item_widget.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final MovieController _movieController = Get.put(MovieController());
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nextion Inc Task',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(FavoriteMoviesScreen());
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Dim.width15),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Movies',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dim.width15),
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: MovieService()
                  .fetchMovies(), // Assuming you have a MovieService
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No movies found.');
                } else {
                  List<Movie> movies = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 2
                          : 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return MovieItemWidget(movie: movies[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
