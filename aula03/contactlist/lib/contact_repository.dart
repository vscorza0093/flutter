import 'package:contactlist/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactRepository {
  Future<ContactModel> getContacts() async {
    var dio = Dio();
    String baseUrl = dotenv.get('BACK_4_APP_BASE_URL');
    dio.options.headers['X-PARSE-Application-Id'] =
        dotenv.get('APPLICATION_KEY');
    dio.options.headers['X-PARSE-REST-API-Key'] = dotenv.get('API_KEY');
    dio.options.headers['Content-Type'] = dotenv.get('CONTENT_TYPE');
    var response = await dio.get("$baseUrl/ContactList");
    return ContactModel.fromJson(response.data);
  }

  Future<void> postContact(Map<String, String> contactInfos) async {
    var dio = Dio();
    Contact newContact = Contact.fromJson(contactInfos);
    String baseUrl = dotenv.get('BACK_4_APP_BASE_URL');
    dio.options.headers['X-PARSE-Application-Id'] =
        dotenv.get('APPLICATION_KEY');
    dio.options.headers['X-PARSE-REST-API-Key'] = dotenv.get('API_KEY');
    dio.options.headers['Content-Type'] = dotenv.get('CONTENT_TYPE');
    await dio.post("$baseUrl/ContactList", data: newContact);
  }

  Future<void> putContact() async {}

  Future<void> deleteContact(String objectId) async {
    var dio = Dio();
    String baseUrl = dotenv.get('BACK_4_APP_BASE_URL');
    dio.options.headers['X-PARSE-Application-Id'] =
        dotenv.get('APPLICATION_KEY');
    dio.options.headers['X-PARSE-REST-API-Key'] = dotenv.get('API_KEY');
    dio.options.headers['Content-Type'] = dotenv.get('CONTENT_TYPE');
    await dio.delete("$baseUrl/ContactList/$objectId");
  }
}
