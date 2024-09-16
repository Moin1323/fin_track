import 'package:expenseapp/3_Application/pages/dashboard%20pages/dashboard_page.dart';
import 'package:expenseapp/3_Application/pages/dashboard%20pages/profile_page.dart';
import 'package:expenseapp/3_Application/pages/dashboard%20pages/transactions_page.dart';
import 'package:flutter/material.dart';

class CommonPage extends StatefulWidget {
  const CommonPage({super.key});

  @override
  State<CommonPage> createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(),
    TransactionsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
