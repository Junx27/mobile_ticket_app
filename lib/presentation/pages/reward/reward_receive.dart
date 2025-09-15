import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_ticket_app/presentation/pages/dashboard_page.dart';

class RewardReceive extends StatelessWidget {
  const RewardReceive({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> history = [
      {
        'name': 'Login Harian',
        'type': '2025-06-09',
        'price': 50000,
        'status': 'Sukses',
      },
      {
        'name': 'Member aktif',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Hadiah Top Up Pertama',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Hadiah Mengisi Survei',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            DashboardPage(initialIndex: 0),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  label: const Text(
                    'Kembali',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // biar bisa dipakai dalam Column
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                              Container(
                                width: 90,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.orange,
                                ),
                                child: Center(
                                  child: Text(
                                    'Klaim',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 50,
        ), // kasih padding biar tidak mepet
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DashboardPage(initialIndex: 0),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Klaim Semua Hadiah',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
