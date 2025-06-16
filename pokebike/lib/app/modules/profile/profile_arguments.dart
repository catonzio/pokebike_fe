import 'package:moto_hunters/app/data/models/user/user.dart';
import 'package:get/get.dart';

class ProfileArguments {
  final User? user;
  final int? profileId;

  const ProfileArguments({this.user, this.profileId});
}
