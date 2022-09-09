import 'package:flutter/material.dart';
import 'package:sama/service_screen.dart';

void main() {
  runApp(const SignIn());
}

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyForm(),
         ),
        
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  void _toogleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  // void toSignIn(BuildContext ctx) {
  //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
  //     return const ServiceScreen();
  //   }));
  // }

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            // padding: const EdgeInsets.only(left: 50.0 , right: 30.0),
            height: 40.0,
            child: Image.asset('assets/images/logo.jpg'),
            ),
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: const Color.fromARGB(255, 7, 61, 136),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          readOnly: true,
                          focusNode: focusNodeEmail,
                          controller: loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.white),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.phone,
                                color: Colors.white, size: 22),
                            hintText: '74845276',
                            hintStyle:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          onSubmitted: (_) {
                            focusNodeEmail.requestFocus();
                          },
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodePassword,
                          controller: loginPasswordController,
                          obscureText: _obscureTextPassword,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              Icons.lock,
                              size: 22.0,
                              color: Colors.white,
                            ),
                            hintText: 'Mot de passe',
                            hintStyle: const TextStyle(
                                fontSize: 17.0, color: Colors.white),
                            suffixIcon: GestureDetector(
                                onTap: _toogleLogin,
                                child: Icon(
                                  _obscureTextPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 15.0,
                                  color: Colors.white,
                                )),
                          ),
                          onSubmitted: (_) {
                            focusNodePassword.requestFocus();
                          },
                          textInputAction: TextInputAction.go,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 170.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(255, 2, 28, 64),
                        Color.fromARGB(255, 2, 28, 64),
                      ],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: const Color.fromARGB(255, 6, 47, 106),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServiceScreen()),
                    );
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'Se connecter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 370.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(side:  const BorderSide(color: Colors.red)),
                    onPressed: () {},
                    child: const Text(
                      'Utiliser SAMA sans connexion internet',
                      style: TextStyle(fontSize: 12.0, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  height: 8.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(side:  const BorderSide(color: Color.fromARGB(255, 6, 47, 106))),
                    onPressed: () {},
                    child: const Text(
                      'Utiliser Sama par WhatsApp',
                      style: TextStyle(fontSize: 12.0, color: Color.fromARGB(255, 6, 47, 106)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
