import 'package:flutter/material.dart';
import 'package:sama/main_drawer.dart';

class ValidateWithDrawMoneyByAgentScreen extends StatelessWidget {
  const ValidateWithDrawMoneyByAgentScreen({Key? key}) : super(key: key);

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
      body: const ValidateWithDrawMoneyByAgent(),
    );
  }
}

class ValidateWithDrawMoneyByAgent extends StatelessWidget {
  const ValidateWithDrawMoneyByAgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          alignment: Alignment.center,
          child: const Text(
            'Valider un retrait',
            style:
                TextStyle(fontSize: 22, color: Color.fromARGB(235, 81, 79, 79)),
          ),
        ),
      ],
    );
  }
}
