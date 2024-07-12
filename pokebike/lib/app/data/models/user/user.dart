// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokebike/app/data/models/profile/profile.dart';
import 'package:pokebike/app/shared/utils/mimage_provider.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'user.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user.g.dart';

String fullName(User user) => "${user.name} ${user.surname}";

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String surname,
    required String email,
    required DateTime birthdate,
    required String avatar,
    required String motoFavoritaAvatar,
    required int profileId,
    Profile? profile,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.fake(int index) => User(
        id: index,
        name: "Name $index",
        surname: "Surname $index",
        email: "email$index@email.com",
        birthdate: DateTime.now(),
        avatar: MImageProvider.getImageUrl(index: index),
        motoFavoritaAvatar: MImageProvider.getImageUrl(index: index),
        profileId: index,
        profile: null, // Profile.fake(index),
      );
}
