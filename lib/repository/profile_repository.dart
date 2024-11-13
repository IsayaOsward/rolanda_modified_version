import '../model/profile.dart';

abstract class ProfileRepository {
  Future<Profile> fetchProfileData();
}
