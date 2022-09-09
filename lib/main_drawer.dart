import 'package:flutter/material.dart';
import 'package:sama/bottom_tab_bar_nav.dart';
import 'package:sama/main.dart';
import 'package:sama/service_screen.dart';
import 'package:sama/transaction_history_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, Function() tapHandler) {
    return ListTile(
      // leading: Icon(
      //   icon,
      //   size: 26,
      // ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: Container(
                // height: 50,
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo1.png',
                      height: 30,
                    ),
                    const Text(
                      'Client: SANOGO ALASSANE',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromARGB(255, 6, 3, 44)),
                    ),
                    const Text(
                      'www.money.money',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromARGB(255, 6, 3, 44)),
                    ),
                    const Text(
                      '(+223)20 22 07 07 / 50 02 31 75',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                    const Text(
                      'SAMA par WhatsApp (+223)67 76 88 88',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                    const Text(
                      'Compte N°: 22374845276',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 20.0,
          ),

            const Divider(),
            buildListTile('Accueil', () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const ServiceScreen(),
                ),
                );
            }),
            const Divider(),
            buildListTile('Historique des Transaction', () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => BottomTabBarNav(pageSelected: const TransactionHistoryScreen(), selectedIndex: 0, botNavBar: true,),
                ),
                );
            }),
            const Divider(),
            buildListTile('Modifier mot de passe', () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const TransactionHistoryScreen(),
                ),
                );
            }),
            const Divider(),
            buildListTile('Déconnexion', () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SignIn(),
                ),
                );
            }),
            const Divider(),
            ],
          ),      
    );
  }
}
