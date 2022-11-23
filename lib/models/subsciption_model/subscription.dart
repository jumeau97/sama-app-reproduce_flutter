import 'package:sama/models/channel/channel.dart';
import 'package:sama/models/term_options/option.dart';
import 'package:sama/models/terms/terms.dart';

class Subscription {
  String cardNumber = '';
  Channel? subscribe;
  List? option;
  Terms? terms;

  // Subscription(this.duration, this.bouquet, this.option, this.cardNumber);

  String get getCardNumber {
    return cardNumber;
  }

  Channel get getBouquet {
    return subscribe!;
  }

  Terms get getDuration {
    return terms!;
  }

  List get getOption {
    return option!;
  }

  set setCardNumber(String cardNumber) {
    this.cardNumber = cardNumber;
  }

  set setBouquet(Channel bouquet) {
    this.subscribe = bouquet;
  }

  set setDuration(Terms duration) {
    this.terms = duration;
  }

  set setOption(option) {
    this.option = option;
  }

   int get calculat {
    int optionPrice = 0;
    for (Option option in this.getOption) {
      optionPrice = optionPrice + option.price;
    }
    var price = (this.getBouquet.price + optionPrice) * 2;
    return price;
  }
}
