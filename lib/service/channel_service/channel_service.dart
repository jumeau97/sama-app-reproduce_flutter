import 'dart:convert';

import 'package:sama/config/config.dart';
import 'package:sama/models/channel/channel.dart';
import 'package:http/http.dart' as http;

class ChannelService {
  

  static Future<List<Channel>> findChannel() async {
    var url = Uri.parse('${baseUrl}subscribe/all');
    http.Response response = await http.get(url, headers: headers);
    // print('${response.body}');
    List responseList = jsonDecode(response.body);
    List<Channel> channels = [];
    for (Map<String, dynamic> channelMap in responseList) {
      Channel channel = Channel.fromJson(channelMap);
      channels.add(channel);
    }
    return channels;
  }


}
