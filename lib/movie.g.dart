// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    json['id'] as int,
    json['url'] as String,
    json['imdb_code'] as String,
    json['title'] as String,
    json['title_english'] as String,
    json['title_long'] as String,
    json['slug'] as String,
    json['year'] as int,
    json['rating'] as num,
    json['runtime'] as int,
    json['genres'] as List<dynamic>,
    json['summary'] as String,
    json['description_full'] as String,
    json['synopsis'] as String,
    json['yt_trailer_code'] as String,
    json['language'] as String,
    json['mpa_rating'] as String,
    json['background_image'] as String,
    json['background_image_original'] as String,
    json['small_cover_image'] as String,
    json['medium_cover_image'] as String,
    json['large_cover_image'] as String,
    json['state'] as String,
    json['torrents'] as List<dynamic>,
    json['date_uploaded'] as String,
    json['date_uploaded_unix'] as int,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'imdb_code': instance.imdbCode,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_long': instance.titleLong,
      'slug': instance.slug,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'summary': instance.summary,
      'description_full': instance.descriptionFull,
      'synopsis': instance.synopsis,
      'yt_trailer_code': instance.ytTrailerCode,
      'language': instance.language,
      'mpa_rating': instance.mpaRating,
      'background_image': instance.backgroundImage,
      'background_image_original': instance.backgroundImageOriginal,
      'small_cover_image': instance.smallCoverImage,
      'medium_cover_image': instance.mediumCoverImage,
      'large_cover_image': instance.largeCoverImage,
      'state': instance.state,
      'torrents': instance.torrents,
      'date_uploaded': instance.dateUploaded,
      'date_uploaded_unix': instance.dateUploadedUnix,
    };
