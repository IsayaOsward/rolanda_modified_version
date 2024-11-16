import 'package:flutter/material.dart';

import '../model/profile_model.dart';
import '../services/profile_service.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileService profileService;
  ProfileModel? _profile;
  bool _isLoading = true;
  String _errorMessage = '';

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  ProfileProvider({required this.profileService});

  Future<void> loadProfileData() async {
    try {
      _isLoading = true;
      // Delay the notification to avoid the issue of calling notifyListeners during the build phase.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });

      _profile = await profileService.getProfileData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      // delay the notification to ensure it does not happen during the build phase.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
