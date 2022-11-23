import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sama/main_drawer.dart';
import 'package:sama/models/subsciption_model/subscription.dart';
import 'package:sama/models/term_options/option.dart';
import 'package:sama/utils/size_helpers.dart';

class MalivisionSubscConfirmation extends StatelessWidget {
  final Subscription subsc;
  const MalivisionSubscConfirmation({super.key, required this.subsc});

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
        body: MalivisionSubscConfirm(
          subsc: subsc,
        ));
  }
}

class MalivisionSubscConfirm extends StatefulWidget {
  final Subscription subsc;

  const MalivisionSubscConfirm({super.key, required this.subsc});

  @override
  State<MalivisionSubscConfirm> createState() => _MalivisionSubscConfirmState();
}

class _MalivisionSubscConfirmState extends State<MalivisionSubscConfirm> {
  var optiontext;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List optionTextList = [];
    for (Option option in widget.subsc.getOption) {
      optionTextList.add(option.name);
    }

    optiontext = optionTextList.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    subscInfo(title, value) {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: displayWidth(context) * 0.04),
                  child: AutoSizeText(
                    '$title: ',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 3, 6, 12),
                        fontSize: displayWidth(context) * 0.06),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  '$value',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 5, 38, 105),
                    fontWeight: FontWeight.bold,
                    fontSize: displayWidth(context) * 0.06,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: displayHeight(context) * 0.09,
          )
        ],
      );
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'Abonnement\nMALIVISION',
            style: TextStyle(fontSize: displayWidth(context) * 0.075),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            bottom: displayHeight(context) * 0.03,
          ),
          child: Text(
            'Montant Total: ${widget.subsc.calculat} Fcfa',
            style: TextStyle(
              color: Colors.red,
              fontSize: displayWidth(context) * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subscInfo('N° décodeur', widget.subsc.cardNumber),
        subscInfo('Bouquet', widget.subsc.getBouquet.name),
        subscInfo('Option', optiontext),
        subscInfo('Durée', widget.subsc.getDuration.term),
        SizedBox(height: displayHeight(context)*0.06,),
        const SendTextButton(),
      ],
    );
  }
}

class SendTextButton extends StatelessWidget {
  const SendTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
      onPressed: () {},
      child: const Text(
        'Envoyer',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    );
  }
}
