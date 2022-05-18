import 'package:barber_shop_alexis/screens/account_screen.dart';
import 'package:barber_shop_alexis/screens/services_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> tabItems = [
      const ServicePage(),
      const ServicePage(),
      const AccountScreen()
    ];
    int activePage = 0;

    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 200),
          items: const [
            Icon(Icons.info_outline, size: 30),
            Icon(Icons.calendar_month_outlined, size: 30),
            Icon(Icons.account_circle_outlined, size: 30),
          ],
          onTap: (index) {
            setState(() {
              activePage = index;
            });
          },
        ),
        backgroundColor: Colors.blueGrey,
        body: tabItems[activePage]);
  }
}
