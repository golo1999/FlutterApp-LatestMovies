import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  Movie(
      this.id,
      this.url,
      this.imdbCode,
      this.title,
      this.titleEnglish,
      this.titleLong,
      this.slug,
      this.year,
      this.rating,
      this.runtime,
      this.genres,
      this.summary,
      this.descriptionFull,
      this.synopsis,
      this.ytTrailerCode,
      this.language,
      this.mpaRating,
      this.backgroundImage,
      this.backgroundImageOriginal,
      this.smallCoverImage,
      this.mediumCoverImage,
      this.largeCoverImage,
      this.state,
      this.torrents,
      this.dateUploaded,
      this.dateUploadedUnix);

  factory Movie.fromJson(Map<String, dynamic> data) => _$MovieFromJson(data);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  static const num maxRating = 10;

  int id;

  String url;

  @JsonKey(name: 'imdb_code')
  String imdbCode;

  String title;

  @JsonKey(name: 'title_english')
  String titleEnglish;

  @JsonKey(name: 'title_long')
  String titleLong;

  String slug;

  int year;

  num rating;

  int runtime;

  List<dynamic> genres;

  String summary;

  @JsonKey(name: 'description_full')
  String descriptionFull;

  String synopsis;

  @JsonKey(name: 'yt_trailer_code')
  String ytTrailerCode;

  String language;

  @JsonKey(name: 'mpa_rating')
  String mpaRating;

  @JsonKey(name: 'background_image')
  String backgroundImage;

  @JsonKey(name: 'background_image_original')
  String backgroundImageOriginal;

  @JsonKey(name: 'small_cover_image')
  String smallCoverImage;

  @JsonKey(name: 'medium_cover_image')
  String mediumCoverImage;

  @JsonKey(name: 'large_cover_image')
  String largeCoverImage;

  String state;

  List<dynamic> torrents;

  @JsonKey(name: 'date_uploaded')
  String dateUploaded;

  @JsonKey(name: 'date_uploaded_unix')
  int dateUploadedUnix;

  dynamic showGenres() {
    final int numberOfGenres = genres.length;
    dynamic genresListed = '';

    for (int genreIndex = 0; genreIndex < numberOfGenres; ++genreIndex) {
      genresListed += genres[genreIndex];

      if (genreIndex < numberOfGenres - 1) {
        genresListed += ' / ';
      }
    }

    return genresListed;
  }

  String showAvailableQualities() {
    final int numberOfAvailableQualities = torrents.length;
    String availableQualitiesListed = '';
    final List<dynamic> torrentList = torrents;

    for (int qualityIndex = 0;
        qualityIndex < numberOfAvailableQualities;
        ++qualityIndex) {
      final dynamic torrent = torrentList[qualityIndex];
      final dynamic torrentQuality = torrent['quality'];
      final String torrentType = torrent['type'] == 'bluray'
          ? 'BluRay'
          : torrent['type'] == 'web'
              ? 'Web'
              : '';

      availableQualitiesListed += torrentQuality.toString() + '.' + torrentType;

      if (qualityIndex < numberOfAvailableQualities - 1)
        availableQualitiesListed += ' / ';
    }

    return numberOfAvailableQualities > 0
        ? 'Available in: ' + availableQualitiesListed
        : availableQualitiesListed;
  }
}
