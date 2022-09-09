import 'package:flutter/material.dart';
import 'package:sama/main_drawer.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

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
          Center(child: Text('Solde', style: TextStyle(color: Color.fromARGB(255, 1, 48, 86),),)),
           Switch(
            value: false,
            onChanged: null,
            inactiveTrackColor: Colors.grey,
          )
        ],
      ),
      drawer: const MainDrawer(),
      // bottomNavigationBar: const BottomTabBarNav(),
      body: const MyTransaction(),
    );
  }
}

class MyTransaction extends StatelessWidget {
  const MyTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 10),
            alignment: Alignment.topCenter,
            child: const Center(
              child: Text(
                'Historique des transactions',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: const [
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
                ListTile(
                  title: Text('USSD Recharge ORANGE::'),
                  subtitle: Text('74845276'),
                  trailing: Text('100'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
