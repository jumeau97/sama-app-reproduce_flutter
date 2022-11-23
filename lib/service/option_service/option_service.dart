import 'dart:convert';

import 'package:sama/config/config.dart';
import 'package:sama/models/term_options/option.dart';
import 'package:http/http.dart' as http;

class OptionService {
  
  static Future<List<Option>> findOptionByid(id) async {
    var url = Uri.parse('${baseUrl}subscribe/options/$id');
    http.Response response = await http.get(url, headers: headers);
    // print('${response.body}');
    List responseList = jsonDecode(response.body);
    List<Option> options = [];
    for (Map<String, dynamic> optionMap in responseList) {
      Option option = Option.fromJson(optionMap);
      options.add(option);
    }
    return options;
  }
}
