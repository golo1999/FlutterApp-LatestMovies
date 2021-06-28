import 'package:json_annotation/json_annotation.dart';

part 'torrent.g.dart';

@JsonSerializable()
class Torrent {
  Torrent(this.url, this.hash, this.quality, this.type, this.seeds, this.peers,
      this.size, this.sizeBytes, this.dateUploaded, this.dateUploadedUnix);

  factory Torrent.fromJson(Map<String, dynamic> data) =>
      _$TorrentFromJson(data);

  Map<String, dynamic> toJson() => _$TorrentToJson(this);

  String url;

  String hash;

  String quality;

  String type;

  int seeds;

  int peers;

  String size;

  @JsonKey(name: 'size_byes')
  int sizeBytes;

  @JsonKey(name: 'date_uploaded')
  String dateUploaded;

  @JsonKey(name: 'date_uploaded_unix')
  int dateUploadedUnix;
}
