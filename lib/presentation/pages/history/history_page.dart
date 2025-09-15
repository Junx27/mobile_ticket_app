import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> history = [
      {
        'name': 'Pembelian Pulsa',
        'type': '2025-06-09',
        'price': 50000,
        'status': 'Sukses',
      },
      {
        'name': 'Bayar Listrik',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Beli Tiket',
        'type': '2025-06-09',
        'price': 120000,
        'status': 'Gagal',
      },
      {
        'name': 'Pembelian Pulsa',
        'type': '2025-06-09',
        'price': 50000,
        'status': 'Sukses',
      },
      {
        'name': 'Bayar Listrik',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Beli Tiket',
        'type': '2025-06-09',
        'price': 120000,
        'status': 'Gagal',
      },
      {
        'name': 'Pembelian Pulsa',
        'type': '2025-06-09',
        'price': 50000,
        'status': 'Sukses',
      },
      {
        'name': 'Bayar Listrik',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Beli Tiket',
        'type': '2025-06-09',
        'price': 120000,
        'status': 'Gagal',
      },
      {
        'name': 'Pembelian Pulsa',
        'type': '2025-06-09',
        'price': 50000,
        'status': 'Sukses',
      },
      {
        'name': 'Bayar Listrik',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Beli Tiket',
        'type': '2025-06-09',
        'price': 120000,
        'status': 'Gagal',
      },
      {
        'name': 'Pembelian Pulsa',
        'type': '2025-06-09',
        'price': 50000,
        'status': 'Sukses',
      },
      {
        'name': 'Bayar Listrik',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Beli Tiket',
        'type': '2025-06-09',
        'price': 120000,
        'status': 'Gagal',
      },
      {
        'name': 'Pembelian Pulsa',
        'type': '2025-06-09',
        'price': 50000,
        'status': 'Sukses',
      },
      {
        'name': 'Bayar Listrik',
        'type': '2025-06-09',
        'price': 250000,
        'status': 'Pending',
      },
      {
        'name': 'Beli Tiket',
        'type': '2025-06-09',
        'price': 120000,
        'status': 'Gagal',
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Riwayat Transaksi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Riwayat Survey',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Riwayat Hadiah',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        // Expanded supaya TextField tidak overflow
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Cari riwayat..',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 20,
                            ),
                            Gap(8),
                            const Icon(
                              Icons.filter_list,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(5),
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
                                width: 50,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: item['status'] == 'Sukses'
                                      ? Colors.green.withOpacity(0.1)
                                      : item['status'] == 'Pending'
                                      ? Colors.orange.withOpacity(0.1)
                                      : Colors.red.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: Text(
                                    item['status'],
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.normal,
                                      color: item['status'] == 'Sukses'
                                          ? Colors.green
                                          : item['status'] == 'Pending'
                                          ? Colors.orange
                                          : Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    size: 12,
                                    color: Colors.orange,
                                  ),
                                  Gap(5),
                                  Text(
                                    item['type'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rp ${item['price']}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
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
    );
  }
}
