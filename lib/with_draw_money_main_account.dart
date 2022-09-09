import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sama/main_drawer.dart';

class WithDrawMoneyMainAccountScreen extends StatelessWidget {
  const WithDrawMoneyMainAccountScreen({Key? key}) : super(key: key);

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
      body: const WithDrawMoneyMainAccount(),
    );
  }
}

class WithDrawMoneyMainAccount extends StatelessWidget {
  const WithDrawMoneyMainAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            alignment: Alignment.center,
            child: const Text(
              'Envoi d\'argent (Compte principal)',
              style: TextStyle(
                  fontSize: 22, color: Color.fromARGB(235, 81, 79, 79)),
            ),
          ),
          Container(
            // color: const Color.fromARGB(255, 227, 227, 227),
            margin: const EdgeInsets.only(top: 25.0, right: 5.0, left: 5.0),
            padding: const EdgeInsets.only(left: 3.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color.fromARGB(255, 219, 219, 219),
            ),
            child: Row(
              children: const [
                Text('+223'),
                Icon(Icons.arrow_drop_down),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone du bénéficiaire',
                    ),
                  ),
                ),
                Icon(
                  Icons.perm_contact_calendar,
                  color: Color.fromARGB(255, 1, 48, 86),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Sans l'indicatif",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0, right: 5.0, left: 5.0),
            padding: const EdgeInsets.only(left: 3.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color.fromARGB(255, 219, 219, 219),
            ),
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Montant',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40.0,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 1, 48, 86),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              child: const Text(
                'Retirer',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
