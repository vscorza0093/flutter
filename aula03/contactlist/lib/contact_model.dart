class ContactModel {
  List<Contact> contacts = [];

  ContactModel(this.contacts);

  ContactModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contacts = <Contact>[];
      json['results'].forEach((v) {
        contacts.add(Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = contacts.map((v) => v.toJson()).toList();
    return data;
  }
}

class Contact {
  String objectId = '';
  String name = '';
  String phone = '';
  String photoUrl = '';
  String createdAt = '';
  String updatedAt = '';

  Contact();

  Contact.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'] ?? '';
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    photoUrl = json['photo_url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['photo_url'] = photoUrl;
    return data;
  }
}
