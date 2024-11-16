import '../model/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> fetchProfileData();
}
