import 'package:flutter/material.dart';
import 'package:sama/main_drawer.dart';

class MeterManagementScreen extends StatelessWidget {
  const MeterManagementScreen({Key? key}) : super(key: key);

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
      body: const MeterManagement(),
    );
  }
}

class MeterManagement extends StatelessWidget {
  const MeterManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 5.0,
          ),
          alignment: Alignment.center,
          child: const Text(
            'Ajout d\'un compteur',
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(235, 81, 79, 79),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
          padding: const EdgeInsets.only(left: 3.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color.fromARGB(255, 219, 219, 219),
          ),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Nom du compteur',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
          padding: const EdgeInsets.only(left: 3.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color.fromARGB(255, 219, 219, 219),
          ),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Nom pour compteur',
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 40.0,
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 30,),
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
              'Enregistrer',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Divider(
                  indent: 20.0,
                  endIndent: 10.0,
                  thickness: 1,
                  // height: 36,
                  color: Color.fromARGB(255, 157, 159, 157),
                ),
              ),
            ),
            const Text('Liste des compteurs'),
            Expanded(
              child: Container(
                // margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: const Divider(
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                  // height: 36,
                  color: Color.fromARGB(255, 157, 159, 157),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
