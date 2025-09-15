import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_ticket_app/presentation/pages/survey_add_ons_description.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderImages1 = [
      "assets/icons/after.jpg",
      "assets/icons/jendela.jpg",
      "assets/icons/cover.jpg",
    ];
    final sliderImages2 = [
      "assets/icons/deep-cover.jpg",
      "assets/icons/thor.jpg",
      "assets/icons/inceptions.jpg",
    ];
    final List<Map<String, dynamic>> categories = [
      {
        'id': 1,
        'name': 'Rekomendasi',
        'icon': Icons.thumb_up,
        'color': Colors.white,
        'count': 1,
      },
      {
        'id': 2,
        'name': 'Survey Cepat',
        'icon': Icons.speed,
        'color': Colors.white,
        'count': 8,
      },
      {
        'id': 3,
        'name': 'Survey Teratas',
        'icon': Icons.star,
        'color': Colors.white,
        'count': 14,
      },
      {
        'id': 4,
        'name': 'Survey Terpopuler',
        'icon': Icons.trending_up,
        'color': Colors.white,
        'count': 56,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/icons/diamond.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Gap(8),
                          Text(
                            "23000",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gap(10),
                          Icon(Icons.add_box, color: Colors.orange, size: 25),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/icons/avatar.jpg',
                          height: 35,
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Fitur Premium",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Temukan fitur minggu ini dengan banyak manfaat",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Gap(4),
                      Row(
                        children: [
                          Text(
                            "Selengkapnya",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Gap(4),
                          Icon(
                            Icons.arrow_circle_up,
                            color: Colors.blue,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/icons/bg-store.jpg',
                        ), // atau NetworkImage()
                        fit: BoxFit
                            .cover, // agar image menutupi seluruh container
                      ),
                    ),
                    child: Text(
                      "23000",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Gap(15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gratis Teratas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Tampilkan',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
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
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Berbayar Teratas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Tampilkan',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  children: sliderImages2.map((path) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(path, fit: BoxFit.cover),
                    );
                  }).toList(),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Semua Kategori',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SurveyAddOnDescription(),
                            ),
                          );
                        },
                        child: const Text(
                          'Selengkapnya',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // jika digabung di Column
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: Container(
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
                        child: Row(
                          children: [
                            // Avatar hitam kecil
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: category['color'],
                                radius: 14,
                                child: Icon(
                                  category['icon'],
                                  color: Colors.black,
                                  size: 14,
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    category['name'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black, // teks hitam juga
                                    ),
                                  ),
                                  Text(
                                    category['count'].toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue, // teks hitam juga
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
