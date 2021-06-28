import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latest_movies/app_data.dart';
import 'package:latest_movies/show_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'movie.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key key}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    setTransparentStatusBar();
  }

  void _showSelectedMovieImage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const ShowImage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        centerTitle: true,
      ),
      body: Container(
        width: data.size.width,
        height: data.size.height,
        color: primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.zero,
                    bottom: Radius.circular(
                      data.size.width * 0.25,
                    ),
                  ),
                  child: Image.network(
                    selectedMovie.mediumCoverImage,
                    fit: BoxFit.fill,
                  ),
                ),
                onTap: () => _showSelectedMovieImage(context),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: data.size.width * 0.025,
                  top: data.size.width * 0.05,
                  right: data.size.width * 0.025,
                  bottom: data.size.width * 0.015,
                ),
                child: Text(
                  selectedMovie.titleLong,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: data.size.width * 0.075,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: data.size.width * 0.015,
                    horizontal: data.size.width * 0.025),
                child: Text(
                  selectedMovie.showGenres().toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: data.size.width * 0.05,
                    fontStyle: FontStyle.italic,
                    color: whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: data.size.width * 0.015,
                    horizontal: data.size.width * 0.025),
                child: Text(
                  selectedMovie.showAvailableQualities(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: data.size.width * 0.05,
                    fontStyle: FontStyle.italic,
                    color: whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: data.size.width * 0.015,
                    horizontal: data.size.width * 0.025),
                child: Row(
                  children: <Widget>[
                    SmoothStarRating(
                      isReadOnly: true,
                      rating: selectedMovie.rating / 2,
                      color: secondaryColor,
                      borderColor: secondaryColor,
                      size: data.size.width * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedMovie.rating.toString() +
                            '/' +
                            Movie.maxRating.toString(),
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: data.size.width * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: data.size.width * 0.015,
                    horizontal: data.size.width * 0.025),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Synopsis',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: data.size.width * 0.075,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 0,
                      ),
                      child: Text(
                        selectedMovie.synopsis,
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: data.size.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
