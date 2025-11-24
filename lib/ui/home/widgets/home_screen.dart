import 'package:flutter/material.dart';
import 'package:life_flutter/ui/investments/widget/investment_screen.dart';
import 'package:life_flutter/ui/more/widgets/more_screen.dart';
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
        return const InvestmentScreen();
      case 2:
        return const UtilitiesScreen();
      case 3:
        return const MoreScreen();
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
      extendBody: true,
      body: Center(
        child: _getPage(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_outlined),
            activeIcon: Icon(Icons.swap_horiz),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            activeIcon: Icon(Icons.monetization_on),
            label: 'Investments'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gas_meter_outlined),
            activeIcon: Icon(Icons.gas_meter),
            label: 'Utilities'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined),
            activeIcon: Icon(Icons.more_horiz),
            label: 'More'
          )
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