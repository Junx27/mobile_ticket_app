import 'package:flutter/material.dart';
import 'package:mobile_ticket_app/presentation/pages/home_page.dart';
import 'package:mobile_ticket_app/presentation/pages/survey_page.dart';
import 'package:mobile_ticket_app/presentation/pages/user_page.dart';
import 'package:mobile_ticket_app/presentation/widget/navbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _HomePageWithNavState();
}

class _HomePageWithNavState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [HomePage(), SurveyPage(), UserPage()];

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
