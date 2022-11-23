import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sama/bottom_tab_bar_nav.dart';
import 'package:sama/send_money_screen.dart';
import 'package:sama/utils/constants.dart';
import 'package:sama/utils/size_helpers.dart';
import 'package:sama/widget/malivision_subscription_screen.dart';


class BuyServiceScreen extends StatelessWidget {
  const BuyServiceScreen({Key? key}) : super(key: key);

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
      body: const BuyService(),
    );
  }
}

class BuyService extends StatelessWidget {
  const BuyService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                displayWidth(context) * 0.07,
                displayWidth(context) * 0.07,
                displayWidth(context) * 0.07,
                displayWidth(context) * 0.02,
              ),
              alignment: Alignment.center,
              child: Text('Achat de Service'),
            ),
            serviceItem('Electricité et Eau', () {
              log('Electricité');
            }, context),
            serviceItem('Abonnement TV', () {
              showDialog(
                context: context,
                builder: (context) => customAlertDialog(context),
              );
            }, context),
            serviceItem('Carburants', () {
              log('Carburants');
            }, context),
            serviceItem('CENOU PAY', () {
              log('CENOU Pay');
            }, context),
            serviceItem('Carte VISA', () {
              log('Carte VISA');
            }, context),
            serviceItem('Assurance', () {
              log('Assurance');
            }, context),
            serviceItem('Ordre des Médecins', () {
              log('Oedre des Médécins');
            }, context),
            serviceItem('Afribone', () {
              log('Afribone');
            }, context),
          ],
        ),
      ),
    );
  }

  Widget customAlertDialog(BuildContext context) {
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
      content: Container(
        padding: EdgeInsets.only(top: displayHeight(context) * 0.1),
        child: Column(
          children: [
            const Text(
              'Abonnement TV',
            ),
            tvSubscription(svgCanalPlus, () {}, context),
            tvSubscription(svgMalivision, () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>BottomTabBarNav(
                    pageSelected: const MalivisionSubscription(),
                    selectedIndex: 0,
                    botNavBar: true,
                  ), 
                ),
              );
            }, context),
            tvSubscription(svgStartTimes, () {}, context),
          ],
        ),
      ),
    );
  }

  Widget tvSubscription(
      String channelNameSvg, Function onSubmit, BuildContext context) {
    return GestureDetector(
      onTap: onSubmit as Function(),
      child: SizedBox(
        width: displayWidth(context),
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(
                top: displayHeight(context) * 0.01,
                bottom: displayHeight(context) * 0.01),
            child: SvgPicture.string(
              channelNameSvg,
              width: displayWidth(context) * 0.4,
            ),
          ),
        ),
      ),
    );
  }

  Widget serviceItem(itemText, Function() onSubmit, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: displayWidth(context) * 0.95,
          child: GestureDetector(
            onTap: onSubmit,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  displayWidth(context) * 0.07,
                  displayWidth(context) * 0.06,
                  displayWidth(context) * 0.07,
                  displayWidth(context) * 0.06,
                ),
                child: Text(
                  itemText.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          endIndent: displayWidth(context) * 0.08,
          indent: displayWidth(context) * 0.08,
          thickness: 1,
        )
      ],
    );
  }
}
