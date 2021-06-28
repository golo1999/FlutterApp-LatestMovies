import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:latest_movies/movie.dart';
import 'package:latest_movies/movie_details.dart';
import './app_data.dart';

void main() {
  runApp(const MaterialApp(
    home: LatestMovies(),
    debugShowCheckedModeBanner: false,
  ));
}

class LatestMovies extends StatelessWidget {
  const LatestMovies({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBody(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({Key key}) : super(key: key);

  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  List<Movie> movieList = <Movie>[];

  @override
  void initState() {
    super.initState();
    setTransparentStatusBar();
    _retrieveMoviesFromAPI();
  }

  void setSelectedMovie(Movie movie) {
    setState(() {
      selectedMovie = movie;
    });
  }

  void _showSelectedMovieDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MovieDetails(),
      ),
    );
  }

  Future<void> _retrieveMoviesFromAPI() async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
    );

    final Response response = await get(url);
    final Map<String, dynamic> responseBody =
        jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> responseBodyData =
        responseBody['data'] as Map<String, dynamic>;
    final List<dynamic> movieListFromAPI =
        responseBodyData['movies'] as List<dynamic>;

    setState(() {
      for (final dynamic movieFromAPI in movieListFromAPI) {
        final Movie movie = Movie(
            movieFromAPI['id'] as int,
            movieFromAPI['url'] as String,
            movieFromAPI['imdb_code'] as String,
            movieFromAPI['title'] as String,
            movieFromAPI['title_english'] as String,
            movieFromAPI['title_long'] as String,
            movieFromAPI['slug'] as String,
            movieFromAPI['year'] as int,
            movieFromAPI['rating'] as num,
            movieFromAPI['runtime'] as int,
            movieFromAPI['genres'] as List<dynamic>,
            movieFromAPI['summary'] as String,
            movieFromAPI['description_full'] as String,
            movieFromAPI['synopsis'] as String,
            movieFromAPI['yt_trailer_code'] as String,
            movieFromAPI['language'] as String,
            movieFromAPI['mpa_rating'] as String,
            movieFromAPI['background_image'] as String,
            movieFromAPI['background_image_original'] as String,
            movieFromAPI['small_cover_image'] as String,
            movieFromAPI['medium_cover_image'] as String,
            movieFromAPI['large_cover_image'] as String,
            movieFromAPI['state'] as String,
            movieFromAPI['torrents'] as List<dynamic>,
            movieFromAPI['date_uploaded'] as String,
            movieFromAPI['date_uploaded_unix'] as int);

        movieList.add(movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            applicationTitle,
            style: TextStyle(
              color: whiteColor,
            ),
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .69,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            final Movie movie = movieList[index];
            return GestureDetector(
              child: GridTile(
                child: Image.network(
                  movie.largeCoverImage,
                  fit: BoxFit.fill,
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black38,
                  title: Text(
                    movie.title,
                  ),
                ),
              ),
              onTap: () {
                setSelectedMovie(movie);
                _showSelectedMovieDetails(context);
              },
            );
          },
          itemCount: movieList.length,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
