import 'package:rolanda_modified_version/model/user_registration_model.dart';
import 'package:rolanda_modified_version/services/registration_services.dart';

class RegistrationRepository {
  final RegistrationService registrationService;

  RegistrationRepository(this.registrationService);

  Future<bool> registerUser(UserRegistration user) {
    return registrationService.registerUser(user);
  }
}
