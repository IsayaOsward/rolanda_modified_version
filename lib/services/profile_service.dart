import '../model/profile_model.dart';
import '../repository/profile_repository.dart';
import '../utils/storage_service.dart';

abstract class ProfileService {
  Future<ProfileModel> getProfileData();
}

class ProfileServiceImpl implements ProfileService {
  final ProfileRepository repository;
  final StorageService storageService;

  ProfileServiceImpl({required this.repository, required this.storageService});

  @override
  Future<ProfileModel> getProfileData() async {
    // Retrieve the user token from the StorageService
    String? token = await storageService.getUserToken();
    if (token == null) {
      throw Exception("Token not found");
    }

    // Call the repository to fetch profile data
    return repository.fetchProfileData();
  }
}
