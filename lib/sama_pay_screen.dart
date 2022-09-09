import 'package:flutter/material.dart';
import 'package:sama/main_drawer.dart';

class SamaPayScreen extends StatelessWidget {
  const SamaPayScreen({Key? key}) : super(key: key);

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
      body: const SamaPay(),
    );
  }
}

class SamaPay extends StatelessWidget {
  const SamaPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sama pay'),
    );
  }
}
