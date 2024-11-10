// services/contact_service.dart
import 'package:rolanda_modified_version/model/contact_model.dart';

abstract class ContactService {
  Future<bool> sendMessage(ContactModel contact);
}
