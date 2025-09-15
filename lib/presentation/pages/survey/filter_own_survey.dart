import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterOwnSurvey extends StatelessWidget {
  const FilterOwnSurvey({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filterSurvey = [
      {'name': 'Semua'},
      {'name': 'Teknologi'},
      {'name': 'Pendidikan'},
      {'name': 'Ekonomi'},
      {'name': 'Politik'},
    ];
    final List<Map<String, dynamic>> filterSurveyStatus = [
      {'name': 'Draft'},
      {'name': 'Belum Dibayar'},
      {'name': 'Sudah Dibayar'},
      {'name': 'Sudah Dipublish'},
    ];
    final List<Map<String, dynamic>> filterSurveyPrice = [
      {'name': 'Nominal kurang dari Rp.1.0000'},
      {'name': 'Antara dari Rp.1.0000 sampai Rp.100.000'},
      {'name': 'Antara dari Rp.1.0000 sampai Rp.100.000'},
      {'name': 'Antara dari Rp.1.0000 sampai Rp.100.000'},
      {'name': 'Antara dari Rp.1.0000 sampai Rp.100.000'},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berdasarkan Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Gap(4),
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: filterSurvey.map<Widget>((e) {
                      return Chip(
                        label: Text(
                          e['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        backgroundColor: e['name'] == 'Pendidikan'
                            ? Colors.orange
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide.none,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berdasarkan Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Gap(4),
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: filterSurveyStatus.map<Widget>((e) {
                      return Chip(
                        label: Text(
                          e['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        backgroundColor: e['name'] == 'Sudah Dibayar'
                            ? Colors.orange
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide.none,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berdasarkan Total Hadiah',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Gap(4),
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: filterSurveyPrice.map<Widget>((e) {
                      return Chip(
                        label: Text(
                          e['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        backgroundColor:
                            e['name'] == 'Nominal kurang dari Rp.1.0000'
                            ? Colors.orange
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide.none,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
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
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Terapkan filter',
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
