import 'package:flutter/material.dart';
import 'package:sama/main_drawer.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

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
      body: const ShoppingList(),
    );
  }
}

class ShoppingList extends StatelessWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            margin: const EdgeInsets.all(5.0),
            color: Colors.red,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                'Vous n\'avez éffectué aucun n\'achat',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
