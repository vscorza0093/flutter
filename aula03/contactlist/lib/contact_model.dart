class ContactModel {
  List<Result> results;

  ContactModel({
    required this.results,
  });
}

class Result {
  String objectId;
  String name;
  String phone;
  String photoUrl;

  Result({
    required this.objectId,
    required this.name,
    required this.phone,
    required this.photoUrl,
  });
}
