import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:sama/buy_service_screen.dart';
import 'package:sama/credit_screen.dart';
import 'package:sama/edm_screen.dart';
import 'package:sama/sama_pay_screen.dart';
import 'package:sama/scolarship_and_salary_screen.dart';
import 'package:sama/send_money_screen.dart';
import 'package:sama/service_screen.dart';
import 'package:sama/transaction_history_screen.dart';
import 'package:sama/with_draw_money.dart';

class BottomTabBarNav extends StatefulWidget {
  int index = 0;
  bool botNavBar = true;
  final TransactionHistoryScreen _transac = const TransactionHistoryScreen();
  final SamaPayScreen _payScreen = const SamaPayScreen();
  final ScolarshipAndSalaryScreen _scolarshipAndSalaryScreen =
      const ScolarshipAndSalaryScreen();
  final SendMoneyScreen _sendMoneyScreen = const SendMoneyScreen();
  final WithDrawMoneyScreen _withDraw = const WithDrawMoneyScreen();
  final EdmScreen _edm = const EdmScreen();
  final CreditScreen _credit = const CreditScreen();
  final BuyServiceScreen _buyService = const BuyServiceScreen();
  final ServiceScreen _serviceScreen = const ServiceScreen();

  Widget _showPage = const TransactionHistoryScreen();
  BottomTabBarNav({Key? key, pageSelected, selectedIndex, botNavBar})
      : super(key: key) {
    _showPage = pageSelected;
    index = selectedIndex;
    botNavBar = botNavBar;
    //  print(botNavBar);
  }

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _serviceScreen;
      case 1:
        return _sendMoneyScreen;
      case 2:
        return _withDraw;
      case 3:
        return _edm;
      case 4:
        return _credit;
      default:
        return _transac;
    }
  }

  @override
  State<BottomTabBarNav> createState() => _BottomTabBarNavState();
}

class _BottomTabBarNavState extends State<BottomTabBarNav> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  //Page name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.botNavBar == false
          ? null
          : Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color.fromARGB(255, 2, 28, 64),
                    width: 3.0,
                  ),
                ),
              ),
              child: CurvedNavigationBar(
                onTap: (selectedIndex) {
                  setState(() {
                    widget.index = selectedIndex;
                    widget._showPage = widget._pageChooser(selectedIndex);
                    if (widget._showPage == widget._serviceScreen) {
                      widget.botNavBar = false;
                    }
                  });
                },
                key: _bottomNavigationKey,
                index: widget.index,
                height: 60.0,
                items: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.home,
                        size: 15,
                        color: Color.fromARGB(255, 2, 28, 64),
                      ),
                      widget.index != 0
                          ? const Text(
                              'Home',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 28, 64),
                                  fontSize: 10.0),
                            )
                          : Container(
                              color: Colors.white,
                            ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.straight,
                        size: 15,
                        color: Colors.redAccent,
                      ),
                      widget.index != 1
                          ? const Text(
                              'Envoi',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 28, 64),
                                  fontSize: 10.0),
                            )
                          : Container(
                              color: Colors.white,
                            ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.south,
                        size: 15,
                        color: Color.fromARGB(255, 2, 28, 64),
                      ),
                      widget.index != 2
                          ? const Text(
                              'Retrait',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 28, 64),
                                  fontSize: 10.0),
                            )
                          : Container(
                              color: Colors.white,
                            ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        size: 15,
                        color: Color.fromARGB(255, 2, 28, 64),
                      ),
                      widget.index != 3
                          ? const Text(
                              'EDM',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 28, 64),
                                  fontSize: 10.0),
                            )
                          : Container(
                              color: Colors.white,
                            ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.phone_enabled,
                        size: 15,
                        color: Color.fromARGB(255, 2, 28, 64),
                      ),
                      widget.index != 4
                          ? const Text(
                              'Credits',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 28, 64),
                                  fontSize: 10.0),
                            )
                          : Container(
                              color: Colors.white,
                            ),
                    ],
                  ),
                ],
                color: Colors.white,
                buttonBackgroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 2, 28, 64),
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 600),
              ),
            ),
      body: widget._showPage,
    );
  }
}
