import 'package:flutter/widgets.dart';
import 'package:sama/models/channel/channel.dart';
import 'package:sama/models/term_options/option.dart';

class ChannelData extends ChangeNotifier {
  List<Channel> channels = [];
  List<Option> selectedIndexes = [];
  List<Option> channelsOption = [];

  void removeSelectIndex(index) async {
    selectedIndexes.remove(index);
    // print(selectedIndexes);
    notifyListeners();
  }

  void addSelectIndex(index) async {
    selectedIndexes.add(index);
    // print(selectedIndexes);
    notifyListeners();
  }
}
