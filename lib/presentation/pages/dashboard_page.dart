import 'package:flutter/material.dart';
import 'package:mobile_ticket_app/presentation/pages/history_page.dart';
import 'package:mobile_ticket_app/presentation/pages/home_page.dart';
import 'package:mobile_ticket_app/presentation/pages/setting_page.dart';
import 'package:mobile_ticket_app/presentation/pages/shop_page.dart';
import 'package:mobile_ticket_app/presentation/pages/survey_page.dart';
import 'package:mobile_ticket_app/presentation/pages/user_page.dart';
import 'package:mobile_ticket_app/presentation/widget/navbar.dart';

class DashboardPage extends StatefulWidget {
  final int initialIndex;

  const DashboardPage({super.key, this.initialIndex = 0});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _pages = const [
    HomePage(),
    SurveyPage(),
    ShopPage(),
    HistoryPage(),
    SettingPage(),
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
      bottomNavigationBar: NavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
