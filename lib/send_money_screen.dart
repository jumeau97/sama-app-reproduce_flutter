import 'package:flutter/material.dart';
import 'package:sama/main_drawer.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

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
      body: const Money(),
    );
  }
}

class Money extends StatelessWidget {
  const Money({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: const [
            FavoriteButton(),
            FormToSendMoney(),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          alignment: Alignment.center,
          child: const Text(
            'Envoi d\'argent',
            style:
                TextStyle(fontSize: 22, color: Color.fromARGB(235, 81, 79, 79)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
                backgroundColor: Colors.white,
                primary: Colors.white,
                side: const BorderSide(
                  color: Color.fromARGB(255, 1, 48, 86),
                  width: 1.8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text(
                "Gestion des numéros favoris",
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 48, 86),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
            ),
            const Icon(
              Icons.edit,
              size: 28,
              color: Color.fromARGB(255, 2, 28, 64),
            ),
          ],
        ),
      ],
    );
  }
}

class FormToSendMoney extends StatefulWidget {
  const FormToSendMoney({Key? key}) : super(key: key);

  @override
  State<FormToSendMoney> createState() => _FormToSendMoneyState();
}

class _FormToSendMoneyState extends State<FormToSendMoney> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  bool isChecked = false;
  final isSelected = <bool>[false, true];
  Color selectedColor = const Color.fromARGB(255, 234, 15, 15);
  // Color noColor = Color.fromARGB(255, 15, 4, 115);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
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
          margin: const EdgeInsets.only(top: 30.0, left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Ajouter ce numéro à mes favoris'),
                  Text(
                    'facultatif',
                    style: TextStyle(color: Colors.red, fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: 100,
                child: Text(
                  'Ajouter les frais de retrait',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ),
              ToggleButtons(
                color: Colors.black.withOpacity(0.60),
                selectedColor: Colors.white,
                // selectedBorderColor: Color.fromARGB(255, 50, 223, 6),
                fillColor: selectedColor,
                splashColor:
                    const Color.fromARGB(255, 238, 44, 0).withOpacity(0.12),
                hoverColor: const Color(0xFF6200EE).withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0),
                constraints: const BoxConstraints(minHeight: 36.0),
                isSelected: isSelected,
                highlightColor: Colors.transparent,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.done,
                          size: 24,
                        ),
                        Text('Oui'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.close,
                          size: 24,
                        ),
                        Text('Non'),
                      ],
                    ),
                  ),
                ],
                onPressed: (index) {
                  setState(() {
                    // print('index:($index)');
                    index == 0
                        ? selectedColor = const Color.fromARGB(255, 26, 96, 200)
                        : selectedColor =
                            const Color.fromARGB(253, 250, 59, 59);
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 40.0,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 1, 48, 86),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)),),
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
    );
  }
}
