import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sama/bottom_tab_bar_nav.dart';
import 'package:sama/buy_service_screen.dart';
import 'package:sama/main_drawer.dart';
import 'package:sama/models/channel/channel.dart';
import 'package:sama/sama_pay_screen.dart';
import 'package:sama/scolarship_and_salary_screen.dart';
import 'package:sama/send_money_screen.dart';
import 'package:sama/service/channel_service/channel_data.dart';
import 'package:sama/service/channel_service/channel_service.dart';
import 'package:sama/transaction_history_screen.dart';
import 'package:sama/utils/constants.dart';
import 'package:sama/utils/size_helpers.dart';
import 'package:sama/with_draw_money.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<Channel>? channels;
  
    findChannel() async {
    channels = await ChannelService.findChannel();
    Provider.of<ChannelData>(context, listen: false).channels = channels!;
    setState(() {});
  }
  var menus = [
    {
      "title": "Historique des transactions",
      "icon": svgHistorique,
      "route": BottomTabBarNav(
        pageSelected: const TransactionHistoryScreen(),
        selectedIndex: 0,
        botNavBar: true,
      ),
    },
    {
      "title": "Envoi d'Argent\n",
      "icon": svgEnvoi,
      "route": BottomTabBarNav(
        pageSelected: const SendMoneyScreen(),
        selectedIndex: 1,
        botNavBar: true,
      ),
    },
    {
      "title": "Retrait d'argent\n",
      "icon": svgRetrait,
      "route": BottomTabBarNav(
        pageSelected: const WithDrawMoneyScreen(),
        selectedIndex: 2,
        botNavBar: true,
      ),
    },
    {
      "title": "Achat de service",
      "icon": svgWarimissen,
      "route": BottomTabBarNav(
        pageSelected: const BuyServiceScreen(),
        selectedIndex: 1,
        botNavBar: true,
      ),
    },
    {
      "title": "SamaPay",
      "icon": svgInfo,
      "route": BottomTabBarNav(
        pageSelected: const SamaPayScreen(),
        selectedIndex: 1,
        botNavBar: true,
      ),
    },
    {
      "title": "Bourse\n/salaire",
      "icon": svgParrainage,
      "route": BottomTabBarNav(
        pageSelected: const ScolarshipAndSalary(),
        selectedIndex: 2,
        botNavBar: true,
      ),
    },
    {
      "title": "Banques\n",
      "icon": svgInfo,
      "route": "",
    },
    {
      "title": "Bonus\n",
      "icon": svgWarimissen,
      "route": "",
    },
    {
      "title": "Infos utiles\n",
      "icon": svgWarimissen,
      "route": "",
    },
    {
      "title": "Profil\n",
      "icon": svgWarimissen,
      "route": "",
    },
    {
      "title": "Autoriser le retrait bourse",
      "icon": svgWarimissen,
      "route": "",
    },
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     findChannel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height- 24) / 2;
    final double itemHeight = displayHeight(context) * 0.01;
    final double itemWidth = displayWidth(context) * 0.01;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 1, 48, 86)),
        actions: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.jpg',
              height: 2.0,
            ),
          ),
          const Switch(
            value: false,
            onChanged: null,
            inactiveTrackColor: Colors.grey,
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 22.0, left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Bienvenue!',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'SANOGO ALASSANE',
                    style: TextStyle(color: Colors.grey, fontSize: 30),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              // width: double.infinity,
              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    //  viewportFraction: 5.0,
                    enlargeCenterPage: false,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((e) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(e.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Colors.grey).withOpacity(0.4)),
                  ),
                );
              }).toList(),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              elevation: 5.0,
              color: Colors.redAccent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Attention aux ANARQUES',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("object");
                        },
                        child: const Icon(
                          Icons.close,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Ne communiquez jamais à personne votre mot de passe ni votre code OTP. Sama ni le CENOU ne vous appelerons jamais au téléphone. Si vous recevez un appel ne dites rien à la personne; Simplement nous envoyer numéro par WhatsApp au 500 23 175 ou 500 23 176.",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: (itemWidth / itemHeight) / 0.66,
              mainAxisSpacing: displayHeight(context) * 0.006,
              crossAxisSpacing: displayWidth(context) * 0.005,
              padding: EdgeInsets.fromLTRB(
                displayWidth(context) * 0.07,
                displayHeight(context) * 0.02,
                displayWidth(context) * 0.07,
                displayHeight(context) * 0.02,
              ),
              primary: false,
              children: menus
                  .map(
                    (menu) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => menu['route'] as Widget,
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.string(
                            menu['icon'] as String,
                            height: displayHeight(context) * 0.1,
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.01,
                          ),
                          Expanded(
                            child: Text(
                              menu['title'].toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Box Multi-Services',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            Container(
              width: double.infinity,
              height: displayHeight(context) * 0.1,
              padding: EdgeInsets.only(bottom: displayHeight(context) * 0.001),
              child: const Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                elevation: 5.0,
                child: Text('content of box multiple service'),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}

class PopupBankAccount extends StatelessWidget {
  const PopupBankAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: const Text(
            'Bank To Wallet',
            style: TextStyle(
              color: Color.fromARGB(235, 81, 79, 79),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              child: const Text(
                'UBA',
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 48, 86),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3.0,
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
              child: const Text(
                'BSIC',
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 48, 86),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
