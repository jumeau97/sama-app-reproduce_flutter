import 'dart:convert';

import 'package:sama/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:sama/models/terms/terms.dart';

class TermsService {



  static Future<List<Terms>> getTermsById(int id) async {
    var url = Uri.parse('${baseUrl}subscribe/terms/$id');
    http.Response response = await http.get(url, headers: headers);
    // print(response.body);
    List responseList = jsonDecode(response.body);
    List<Terms> terms = [];
    for (Map<String, dynamic> termsMap in responseList) {
      Terms term = Terms.fromJson(termsMap);
      terms.add(term);
    }
    return terms;
  }

 
}
