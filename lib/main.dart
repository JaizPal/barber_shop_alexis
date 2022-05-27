import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import './screens/account_screen.dart';
import './screens/services_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<dynamic> _page = [
    const ServicePage(),
    const ServicePage(),
    const AccountScreen(),
  ];
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    List<double> textsSizes = [12, 12, 12];

    List<Text> texts = [
      Text(
        "Servicios",
        style: TextStyle(fontSize: textsSizes[0]),
      ),
      Text(
        "Cita",
        style: TextStyle(fontSize: textsSizes[1]),
      ),
      Text(
        "Cuenta",
        style: TextStyle(fontSize: textsSizes[2]),
      ),
    ];

    List<Text> titles = [
      const Text("Servicios"),
      const Text("Citas"),
      const Text("Cuenta")
    ];

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _activePage,
          items: const [
            Icon(
              Icons.info_outline,
            ),
            Icon(
              Icons.calendar_month_outlined,
            ),
            Icon(
              Icons.account_circle_outlined,
            ),
          ],
          height: 60,
          backgroundColor: Colors.blueGrey,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              textsSizes.forEach((element) {
                element = 0;
              });
              _activePage = index;
              textsSizes[index] = 12;
            });
          },
          letIndexChange: (index) => true,
        ),
        appBar: AppBar(
          title: titles[_activePage],
          backgroundColor: Colors.blueGrey,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: _page[_activePage],
          ),
        ));
  }
}
