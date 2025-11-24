import 'package:flutter/material.dart';
import 'package:life_flutter/ui/investments/widget/investment_screen.dart';
import 'package:life_flutter/ui/transactions/widgets/transaction_screen.dart';
import 'package:life_flutter/ui/utilities/widgets/utilities_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const TransactionScreen();
      case 1:
        return const
      case 1:
        return const InvestmentScreen();
      case 2:
        return const UtilitiesScreen();
      default:
        return const TransactionScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getPage(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            activeIcon: Icon(Icons.monetization_on),
            label: 'Investment'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gas_meter_outlined),
            activeIcon: Icon(Icons.gas_meter),
            label: 'Utilities'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
    );
  }
}