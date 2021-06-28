// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'torrent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Torrent _$TorrentFromJson(Map<String, dynamic> json) {
  return Torrent(
    json['url'] as String,
    json['hash'] as String,
    json['quality'] as String,
    json['type'] as String,
    json['seeds'] as int,
    json['peers'] as int,
    json['size'] as String,
    json['size_byes'] as int,
    json['date_uploaded'] as String,
    json['date_uploaded_unix'] as int,
  );
}

Map<String, dynamic> _$TorrentToJson(Torrent instance) => <String, dynamic>{
      'url': instance.url,
      'hash': instance.hash,
      'quality': instance.quality,
      'type': instance.type,
      'seeds': instance.seeds,
      'peers': instance.peers,
      'size': instance.size,
      'size_byes': instance.sizeBytes,
      'date_uploaded': instance.dateUploaded,
      'date_uploaded_unix': instance.dateUploadedUnix,
    };
