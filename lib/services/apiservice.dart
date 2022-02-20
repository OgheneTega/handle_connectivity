//  handles all outbound connections from our application
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> call(url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
