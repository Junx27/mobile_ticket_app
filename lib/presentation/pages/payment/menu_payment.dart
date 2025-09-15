import 'package:flutter/material.dart';
import 'package:mobile_ticket_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:mobile_ticket_app/presentation/widget/slider_page_route.dart';

class MenuPayment extends StatelessWidget {
  const MenuPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      SlidePageRoute(page: DashboardPage(initialIndex: 0)),
                    );
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  label: const Text('', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
