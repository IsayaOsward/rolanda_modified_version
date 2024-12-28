import 'dart:convert';
import 'dart:developer' as developer;
import 'package:rolanda_modified_version/config/base_url.dart';

import '../model/profile_model.dart';
import '../repository/profile_repository.dart';
import '../utils/storage_service.dart';
import 'package:http/http.dart' as http;

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<ProfileModel> fetchProfileData() async {
    final Uri profileUrl = Uri.parse('$baseUrl/dashboard/api/profile/');
    try {
      // Get the token
      String? token = await StorageService().getUserToken();
      if (token == null) {
        throw Exception("User token is not available");
      }

      final response = await http.get(
        profileUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
                developer.log("=====================${response.body}");

        final profileData = json.decode(response.body);
        final profile = profileData['profile'];
        profile['email'] =
            profileData['user']['email']; // Add email to profile data
        return ProfileModel.fromJson(profile);
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (e) {
      throw Exception('Error fetching profile data: $e');
    }
  }
}
