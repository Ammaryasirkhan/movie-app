import 'dart:convert';
import 'package:http/http.dart' as http;

import 'movie_model.dart';

class MovieService {
  final String apiKey = '667be35050e838ddf2b14e03f9c78173';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data
          .map((e) => Movie(
                id: e['id'],
                title: e['title'],
                releaseDate: e['release_date'],
                overview: e['overview'],
                posterUrl: 'https://image.tmdb.org/t/p/w500${e['poster_path']}',
              ))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
