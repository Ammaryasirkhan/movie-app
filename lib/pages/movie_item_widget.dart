import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextion/pages/dimensions.dart';

import '../model/movie_model.dart';
import 'movies_detail_page.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;

  const MovieItemWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MovieDetailPage(movie: movie));
      },
      child: Card(
        color: Colors.black12,
        margin: EdgeInsets.symmetric(horizontal: Dim.width20),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image.network(
                    movie.posterUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dim.width15),
                    child: GestureDetector(
                      onTap: () {
                        // Use GetX to observe changes in isFavorite
                        movie.isFavorite.toggle();
                      },
                      child: Obx(() => Icon(
                            movie.isFavorite.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: Dim.iconsize24 * 1.5,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dim.width15),
              child: Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Dim.width10, bottom: Dim.width10),
              child: Text(
                'Release Date: ${movie.releaseDate}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
