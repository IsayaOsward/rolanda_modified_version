import 'package:rolanda_modified_version/model/user_registration_model.dart';

abstract class RegistrationService {
  Future<int> registerUser(UserRegistration user);
}
