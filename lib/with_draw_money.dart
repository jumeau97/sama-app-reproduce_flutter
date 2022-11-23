import 'package:flutter/material.dart';
import 'package:sama/bottom_tab_bar_nav.dart';
import 'package:sama/main_drawer.dart';
import 'package:sama/validate_with_draw_money_by_agent_screen.dart';
import 'package:sama/with_draw_money_main_account.dart';

class WithDrawMoneyScreen extends StatelessWidget {
  const WithDrawMoneyScreen({Key? key}) : super(key: key);

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
      body: const Money(),
    );
  }
}

class Money extends StatelessWidget {
  const Money({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5.0, bottom: 25.0),
            alignment: Alignment.center,
            child: const Text(
              'Retrait d\'argent',
              style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(235, 81, 79, 79),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomTabBarNav(
                          pageSelected: const WithDrawMoneyMainAccountScreen(),
                          selectedIndex: 2,
                          botNavBar: true,
                        )),
              );
            },
            child: Card(
              elevation: 5.0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 15.0,
                ),
                child: const Text(
                  'Effectuer un retrait (Compte Principal)',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 48, 86),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 25.0),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomTabBarNav(
                    pageSelected: const ValidateWithDrawMoneyByAgentScreen(),
                    selectedIndex: 2,
                    botNavBar: true,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5.0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 15.0,
                ),
                child: const Text(
                  'Valider un retrait initier par un agent)',
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 48, 86),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
