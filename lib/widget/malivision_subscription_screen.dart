import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sama/main_drawer.dart';
import 'package:sama/models/subsciption_model/subscription.dart';
import 'package:sama/models/term_options/option.dart';
import 'package:sama/models/terms/terms.dart';
import 'package:sama/service/channel_service/channel_data.dart';
import 'package:sama/service/option_service/option_service.dart';
import 'package:sama/service/terms_service/terms_data.dart';
import 'package:sama/service/terms_service/terms_service.dart';

import 'package:sama/utils/size_helpers.dart';
import 'package:sama/widget/bouquet_option_select.dart';
import 'package:sama/widget/malivision_subsc_confirm.dart';

class MalivisionSubscription extends StatelessWidget {
  const MalivisionSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 1, 48, 86),
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo.jpg',
            height: 40.0,
          ),
        ),
        actions: const [
          Center(
              child: Text(
            'Solde',
            style: TextStyle(
              color: Color.fromARGB(255, 1, 48, 86),
            ),
          )),
          Switch(
            value: false,
            onChanged: null,
            inactiveTrackColor: Colors.grey,
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: const SubscriptionForm(),
    );
  }
}

class SubscriptionForm extends StatefulWidget {
  const SubscriptionForm({super.key});

  @override
  State<SubscriptionForm> createState() => _SubscriptionFormState();
}

class _SubscriptionFormState extends State<SubscriptionForm> {
  List<Terms> termsById = [];
  List<Option> optionsById =[];
  bool _submitted = false;
  Subscription subsc = Subscription();

  TextEditingController cardNumber = TextEditingController();
  TextEditingController bouquetSelect = TextEditingController();
  TextEditingController optionform = TextEditingController();
  TextEditingController durationSelect = TextEditingController();

  String? _errorText(TextEditingController controller, String formName) {
    final text = controller.value.text;
    if (text.isEmpty) {
      return 'Veuillez renseignez $formName';
    }

    if (text.isNotEmpty) {
      return null;
    }
  }

  findTermsById(id) async {
    termsById = await TermsService.getTermsById(id);
    Provider.of<TermsData>(context, listen: false).terms.clear();
    Provider.of<TermsData>(context, listen: false).terms = termsById!;
    setState(() {});
  }

  findOptionById(id) async {
    optionsById = await OptionService.findOptionByid(id);
    Provider.of<ChannelData>(context, listen: false).channelsOption.clear();
    Provider.of<ChannelData>(context, listen: false).channelsOption =
        optionsById!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Abonnement\nMALIVISION',
              style: TextStyle(fontSize: displayWidth(context) * 0.075),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: displayHeight(context) * 0.15,
              ),
              customTextButton('Gestion des\n décodeurs', context),
              // Padding(padding: EdgeInsets.symmetric(horizontal: displayWidth(context)*0.01)),
              customTextButton('Modifier le\n bouquet', context),
            ],
          ),
          customTextFormField('le numéro', 'Numéro de la carte', false, null,
              cardNumber, context),
          customTextFormField('bouquet', 'Sélectionnez votre bouquet', true,
              () {
            showDialog(
              context: context,
              builder: (context) => bouquetDialog(context),
            );
          }, bouquetSelect, context),
          customTextFormField('l\'option', 'Option', true, () {
            showDialog(
              context: context,
              builder: (context) => BouquetOptionSelect(subsc:subsc, optionsById: optionsById,optionform: optionform,),
            );
          }, optionform, context),
          customTextFormField('la durée', 'Sélectionnez la durée', true, () {
            showDialog(
              context: context,
              builder: (context) => subscriptionDurationDialog(context),
            );
          }, durationSelect, context),
          SizedBox(
            height: displayWidth(context) * 0.1,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.fromLTRB(
                displayWidth(context) * 0.2,
                displayHeight(context) * 0.02,
                displayWidth(context) * 0.2,
                displayHeight(context) * 0.02,
              ),
              backgroundColor: const Color.fromARGB(255, 5, 38, 105),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(style: BorderStyle.none),
              ),
            ),
            onPressed: () {
              if (cardNumber.text.isEmpty ||
                  bouquetSelect.text.isEmpty ||
                  optionform.text.isEmpty ||
                  durationSelect.text.isEmpty) {
                setState(() {
                  _submitted = true;
                });
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MalivisionSubscConfirmation(
                      subsc: subsc,
                    ),
                  ),
                );
              }
            },
            child: const Text(
              'Suivant',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextButton(label, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: displayWidth(context) * 0.04,
            right: displayWidth(context) * 0.04),
        child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 5, 38, 105),
          ),
          child: Container(
            child: Text(
              label.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextFormField(formName, labelText, readRight, selectOption,
      field, BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        displayWidth(context) * 0.02,
        displayHeight(context) * 0,
        displayWidth(context) * 0.02,
        displayHeight(context) * 0.02,
      ),
      child: TextFormField(
        onChanged: (value) {
          labelText == "Numéro de la carte"
              ? setState(() {
                  subsc.cardNumber = value;
                  print(cardNumber.text);
                })
              : null;
        },
        keyboardType:
            formName == 'le numéro' ? TextInputType.number : TextInputType.text,
        style: const TextStyle(
            color: Color.fromARGB(255, 5, 38, 105),
            fontWeight: FontWeight.bold),
        controller: field,
        onTap: selectOption,
        readOnly: readRight,
        decoration: InputDecoration(
          errorText: _submitted == false ? null : _errorText(field, formName),
          suffixIcon: labelText == 'Numéro de la carte'
              ? null
              : Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: displayWidth(context) * 0.02,
          ),
          hintText: labelText.toString(),
          fillColor: const Color.fromARGB(255, 230, 238, 245),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget subscriptionDurationDialog(BuildContext context) {
    return termsById.isNotEmpty
        ? AlertDialog(
            insetPadding: EdgeInsets.only(
              left: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.05,
              top: displayWidth(context) * 0.2,
              bottom: displayWidth(context) * 0.2,
            ),
            contentPadding: EdgeInsets.fromLTRB(
              displayWidth(context) * 0.03,
              displayHeight(context) * 0.01,
              displayWidth(context) * 0.03,
              displayHeight(context) * 0.01,
            ),
            content: Consumer<TermsData>(
              builder: (context, value, child) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.4,
                    width: displayWidth(context) * 0.4,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.terms.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                              displayWidth(context) * 0.02,
                              displayWidth(context) * 0.02,
                              displayWidth(context) * 0.02,
                              displayWidth(context) * 0.02),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                durationSelect.text = value.terms[index].term;
                                subsc.setDuration = value.terms[index];
                                // print(subsc.getDuration.amount);
                                // print(durationSelect.text);
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              value.terms[index].term.toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 6, 44, 75),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  Widget bouquetDialog(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.only(
        left: displayWidth(context) * 0.05,
        right: displayWidth(context) * 0.05,
        top: displayWidth(context) * 0.2,
        bottom: displayWidth(context) * 0.2,
      ),
      contentPadding: EdgeInsets.fromLTRB(
        displayWidth(context) * 0.03,
        displayHeight(context) * 0.01,
        displayWidth(context) * 0.03,
        displayHeight(context) * 0.01,
      ),
      content: Consumer<ChannelData>(
        builder: (context, value, child) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: displayHeight(context) * 0.4,
              width: displayWidth(context) * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: value.channels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        displayWidth(context) * 0.02,
                        displayWidth(context) * 0.02,
                        displayWidth(context) * 0.02,
                        displayWidth(context) * 0.02),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          bouquetSelect.text = value.channels[index].type;
                          subsc.setBouquet = value.channels[index];
                          // print(subsc.getBouquet.name);
                          Provider.of<ChannelData>(context, listen: false)
                              .selectedIndexes
                              .clear();
                          optionform.text = '';
                          // subsc.setDuration = bouquetSelect.text;
                          // print(subsc.getDuration);
                        });
                        var channelId = value.channels[index].id;
                        findTermsById(channelId);
                        findOptionById(channelId);
                        Navigator.pop(context);
                      },
                      child: Text(
                        '${value.channels[index].type}(${value.channels[index].price})',
                        style: TextStyle(
                            color: Color.fromARGB(255, 6, 44, 75),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget 
}
