import 'package:flutter/material.dart';

class ScolarshipAndSalaryScreen extends StatelessWidget {
  const ScolarshipAndSalaryScreen({Key? key}) : super(key: key);

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
      drawer: const Drawer(),
      body: const ScolarshipAndSalary(),
    );
  }
}

class ScolarshipAndSalary extends StatelessWidget {
  const ScolarshipAndSalary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('scolarship and salary'),
    );
  }
}
