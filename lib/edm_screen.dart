import 'package:flutter/material.dart';
import 'package:sama/bottom_tab_bar_nav.dart';
import 'package:sama/main_drawer.dart';
import 'package:sama/meter_management_screen.dart';
import 'package:sama/shopping_list_screen.dart';

class EdmScreen extends StatelessWidget {
  const EdmScreen({Key? key}) : super(key: key);

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
      body: const Edm(),
    );
  }
}

class Edm extends StatelessWidget {
  const Edm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 5.0,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Recharge EDM ISAGO',
              style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(235, 81, 79, 79),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 36,
                  margin:
                      const EdgeInsets.only(top: 9.0, bottom: 9.0, left: 9.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        backgroundColor: const Color.fromARGB(255, 2, 41, 72),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomTabBarNav(
                                      pageSelected:
                                          const MeterManagementScreen(),
                                      selectedIndex: 0,
                                      botNavBar: true,
                                    )));
                      },
                      child: const Text(
                        'Gestion compteurs',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 36,
                  margin: const EdgeInsets.all(9.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10.0),
                        backgroundColor: const Color.fromARGB(255, 2, 41, 72),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomTabBarNav(
                                      pageSelected:
                                          const ShoppingListScreen(),
                                      selectedIndex: 3,
                                      botNavBar: true,
                                    )));
                      },
                      child: const Text(
                        'Liste des achats',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0, right: 5.0, left: 5.0),
            padding: const EdgeInsets.only(left: 3.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color.fromARGB(255, 219, 219, 219),
            ),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Numéro du compteur',
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
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
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
                primary: const Color.fromARGB(255, 2, 41, 72),
                padding: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              child: const Text(
                'Envoyer',
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
