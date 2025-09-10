import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'icon': 'assets/icons/user.png',
        'label': 'Membership',
        'route': '/user',
      },
      {
        'icon': 'assets/icons/survey.png',
        'label': 'Data Survei',
        'route': '/surveys',
      },
      {
        'icon': 'assets/icons/payment.png',
        'label': 'Pembayaran',
        'route': '/settings',
      },
      {
        'icon': 'assets/icons/followers.png',
        'label': 'Mengikuti',
        'route': '/settings',
      },
      {
        'icon': 'assets/icons/accounts.png',
        'label': 'Kolaborator',
        'route': '/user',
      },
      {
        'icon': 'assets/icons/send-gift.png',
        'label': 'Hadiah',
        'route': '/surveys',
      },
    ];

    final sliderImages = [
      "assets/icons/boruto.jpg",
      "assets/icons/one_piece.jpg",
      "assets/icons/test.jpg",
    ];
    final sliderImages1 = [
      "assets/icons/after.jpg",
      "assets/icons/jendela.jpg",
      "assets/icons/cover.jpg",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ biar bisa scroll
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // saldo box (tetap sama seperti kode kamu)
                Container(
                  width: double.infinity,
                  height: 180,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/icons/bg.jpg',
                      ), // atau NetworkImage()
                      fit:
                          BoxFit.cover, // agar image menutupi seluruh container
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Saldo Sekarang',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Icon(
                            Icons.notifications,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ],
                      ),
                      const Gap(10),
                      const Text(
                        'Rp. 1.000.000,00',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // Pengeluaran
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pengeluaran',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_upward,
                                        color: Colors.red,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Rp. 50.000',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Pemasukan
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pemasukan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_downward,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Rp. 120.000',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(30),
                // Menu grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, item['route'] as String);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              item['icon'] as String,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['label'] as String,
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const Gap(20),

                // Slider
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Berakhir Minggu Ini!",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 160,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeCenterPage: false,
                    viewportFraction: 0.85,
                  ),
                  items: sliderImages.map((path) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          path,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const Gap(20),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rekomendasi Untuk Anda!!",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),

                // Rekomendasi grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  children: sliderImages1.map((path) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(path, fit: BoxFit.cover),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
