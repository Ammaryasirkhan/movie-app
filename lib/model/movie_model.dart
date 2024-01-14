import 'package:get/get.dart';

class Movie {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final String posterUrl;
  var isFavorite = false.obs;

  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterUrl,
  });
}
