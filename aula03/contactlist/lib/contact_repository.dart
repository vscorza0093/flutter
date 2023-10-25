import 'package:contactlist/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactRepository {
  Future<ContactModel> getContacts() async {
    var dio = Dio();
    dio.options.headers['X-PARSE-Application-Id'] =
        dotenv.get('APPLICATION_KEY');
    dio.options.headers['X-PARSE-REST-API-Key'] = dotenv.get('API_KEY');
    dio.options.headers['Content-Type'] = dotenv.get('CONTENT_TYPE');
    return ContactModel(results: []);
  }

  Future<void> postContact() async {}
  Future<void> putContact() async {}
  Future<void> deleteContact() async {}
}
