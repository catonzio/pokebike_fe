// This file is "main.dart"
// import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'notifica_data.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'notifica_data.g.dart';

@freezed
class NotificaData with _$NotificaData {
  const factory NotificaData({
    required String title,
    required String body,
    required dynamic data,
  }) = _NotificaData;

  factory NotificaData.fromJson(Map<String, Object?> json) =>
      _$NotificaDataFromJson(json);

  factory NotificaData.fake(int index) => NotificaData(
      title: "NotificaData $index",
      body: "Body $index",
      data: null // DateTime.now()
      );
}
