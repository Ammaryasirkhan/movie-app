
import 'package:get/get.dart';
import '../model/movie_model.dart';

class MovieController extends GetxController {
  var favoriteMovies = <Movie>[].obs;

  void toggleFavorite(Movie movie) {
    movie.isFavorite.toggle();
    if (movie.isFavorite.value) {
      favoriteMovies.add(movie);
    } else {
      favoriteMovies.removeWhere((favoriteMovie) => favoriteMovie.id == movie.id);
    }
    update();
  }
}
