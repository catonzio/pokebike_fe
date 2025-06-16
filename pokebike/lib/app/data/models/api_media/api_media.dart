import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_media.freezed.dart';
part 'api_media.g.dart';

@freezed
class ApiMedia with _$ApiMedia {
  const factory ApiMedia({required int id, required String url, String? key}) =
      _ApiMedia;

  factory ApiMedia.fromJson(dynamic json) =>
      _$ApiMediaFromJson(json as Map<String, dynamic>);
  factory ApiMedia.empty() => ApiMedia(id: -1, url: "");
}
