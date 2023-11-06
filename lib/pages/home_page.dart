import 'package:flutter/material.dart';
import 'package:invest_app/pages/account.dart';
import 'package:invest_app/pages/product.dart';
import 'package:invest_app/pages/transaction.dart';
import 'package:invest_app/pages/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int currentTab = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor:const Color.fromRGBO(48, 169, 94, 1),
    unselectedItemColor: Colors.grey,
    onTap: (int index) {
      setState(() {
        currentTab = index;
      });
    },
    currentIndex: currentTab,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Product'),
      BottomNavigationBarItem(icon: Icon(Icons.swap_horizontal_circle_outlined), label: 'Transaction'),
      BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Account'),
    ]),
    );
  }



  Widget body() {
    return getBody();
}

Widget getBody() {
 switch (currentTab) {
  case 0: 
   return const WelcomePage();
  case 1: 
   return const Product();
  case 2:
   return const Transaction();
  case 3:
   return const Account();
  default:
   return Container();

 }
}
}