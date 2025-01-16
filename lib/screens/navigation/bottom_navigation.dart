import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/theme.dart';
import 'package:flutter_application_1/screens/account/account_screen.dart';
import 'package:flutter_application_1/screens/contract/contract_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/invoices/invoices_screen.dart';
import 'package:flutter_application_1/screens/notifications/notifications_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  final List<String> _svgIcons = [
    'assets/icons/home.svg',
    'assets/icons/card.svg',
    'assets/icons/slip.svg',
    'assets/icons/bell.svg',
    'assets/icons/me.svg',
  ];

  final List<Widget> _screens = [
    const HomeScreen(),
    const MyInvoicesScreen(),
    const ContractScreen(),
    const NotificationsScreen(),
    const MyAccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _svgIcons.map((String iconPath) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                _svgIcons.indexOf(iconPath) == _selectedIndex
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                BlendMode.srcIn,
              ),
              height: 20,
            ),
            label: '',
          );
        }).toList(),
        currentIndex: _selectedIndex,
        backgroundColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
