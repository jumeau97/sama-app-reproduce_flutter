import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sama/models/subsciption_model/subscription.dart';
import 'package:sama/models/term_options/option.dart';
import 'package:sama/service/channel_service/channel_data.dart';
import 'package:sama/utils/size_helpers.dart';

class BouquetOptionSelect extends StatefulWidget {
  final Subscription subsc;
  final List<Option> optionsById;
  final TextEditingController optionform ;
  const BouquetOptionSelect({super.key, required this.subsc, required this.optionsById, required this.optionform});

  @override
  State<BouquetOptionSelect> createState() => _BouquetOptionSelectState();
}

class _BouquetOptionSelectState extends State<BouquetOptionSelect> {
  @override
  Widget build(BuildContext context) {
    return widget.optionsById.isNotEmpty
        ? AlertDialog(
            content: Consumer<ChannelData>(
              builder: (context, value, child) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.4,
                    width: displayWidth(context) * 0.9,
                    child: ListView.builder(
                      itemCount: value.channelsOption.length,
                      itemBuilder: (_, index) {
                        return Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: CheckboxListTile(
                            title: Text(value.channelsOption[index].name),
                            subtitle: Text(
                              ('${value.channelsOption[index].price.toString()} Fcfa'),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 6, 44, 75),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: value.selectedIndexes
                                .contains(value.channelsOption[index]),
                            onChanged: (_) {
                              setState(() {
                                if (value.selectedIndexes
                                    .contains(value.channelsOption[index])) {
                                  // print('remove option');
                                  value.removeSelectIndex(
                                      value.channelsOption[index]);
                                } else {
                                  // print('add option');
                                  value.addSelectIndex(
                                      value.channelsOption[index]);
                                }
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.04,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 44, 75),
                    ),
                    onPressed: () {
                      List selectedIndexses =
                          Provider.of<ChannelData>(listen: false, context)
                              .selectedIndexes;
                      widget.subsc.setOption = selectedIndexses;
                      // for (Option a in subsc.getOption) {
                      //   print('a: ${a.name}');
                      // }
                      List optionTextList = [];
                      for (Option option in selectedIndexses) {
                        optionTextList.add(option.name);
                      }
                      var optiontext = optionTextList.join(", ");
                      setState(() {
                        widget.optionform.text = optiontext;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'valider',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
