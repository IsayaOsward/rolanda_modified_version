import 'package:rolanda_modified_version/model/contact_model.dart';

import '../services/contact_service.dart';

class ContactRepository {
  final ContactService contactService;

  ContactRepository({required this.contactService});

  Future<bool> sendMessage(ContactModel contact) {
    return contactService.sendMessage(contact);
  }
}
