import 'package:moto_hunters/app/data/models/user/user.dart';

class ProfileArguments {
  final User? user;
  final int? profileId;

  const ProfileArguments({this.user, this.profileId});
}
