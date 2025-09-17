import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_ticket_app/presentation/pages/survey/create_survey.dart';
import 'package:mobile_ticket_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:mobile_ticket_app/presentation/pages/survey/filter_own_survey.dart';
import 'package:mobile_ticket_app/presentation/widget/slider_page_route.dart';

class MenuSurvey extends StatelessWidget {
  const MenuSurvey({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderImages1 = [
      "assets/icons/after.jpg",
      "assets/icons/jendela.jpg",
      "assets/icons/cover.jpg",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          final dashboardState = context
                              .findAncestorStateOfType<DashboardPageState>();
                          dashboardState?.replaceNavItem(0, 0);
                        },
                      ),
                      IconButton(
                        icon: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.orange, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: const Icon(
                            Icons.add_circle,
                            size: 30,
                            color: Colors
                                .white, // penting: tetap kasih warna putih biar gradient keliatan
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateSurveyForm(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8),
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
                            IconButton(
                              icon: const Icon(Icons.filter_list, size: 20),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  SlidePageRoute(page: FilterOwnSurvey()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
