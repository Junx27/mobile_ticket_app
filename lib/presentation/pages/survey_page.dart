import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:mobile_ticket_app/presentation/bloc/survey/survey_event.dart';
import 'package:shimmer/shimmer.dart';
import '../../domain/entities/survey.dart';
import '../../presentation/bloc/survey/survey_bloc.dart';
import '../../presentation/bloc/survey/survey_state.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SurveyBloc, SurveyState>(
            builder: (context, state) {
              if (state is SurveyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SurveyLoaded) {
                final surveys = state.surveys;
                final filteredSurveys = surveys
                    .where((s) => s.price > 10000)
                    .toList();
                final filteredSurveyTekonologies = surveys
                    .where((s) => s.category.toLowerCase() == 'teknologi')
                    .take(3)
                    .toList();
                final filteredSurveyKesehatan = surveys
                    .where((s) => s.category.toLowerCase() == 'kesehatan')
                    .take(3)
                    .toList();
                if (surveys.isEmpty) {
                  return const Center(child: Text('Tidak ada survey'));
                }
                return SurveyGrid(
                  surveys: surveys,
                  filteredSurveys: filteredSurveys,
                  filteredSurveyTekonologies: filteredSurveyTekonologies,
                  filteredSurveyKesehatan: filteredSurveyKesehatan,
                );
              } else if (state is SurveyError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Tidak ada data'));
              }
            },
          ),
        ),
      ),
    );
  }
}

class SurveyGrid extends StatelessWidget {
  final List<Survey> surveys;
  final List<Survey> filteredSurveys;
  final List<Survey> filteredSurveyTekonologies;
  final List<Survey> filteredSurveyKesehatan;

  const SurveyGrid({
    super.key,
    required this.surveys,
    required this.filteredSurveys,
    required this.filteredSurveyTekonologies,
    required this.filteredSurveyKesehatan,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        context.read<SurveyBloc>().add(GetSurveysEvent());
      },
      builder: (context, child, controller) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Stack(
              children: [
                if (!controller.isIdle)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Icon(
                        Icons.refresh, // ganti icon sesuai kebutuhan
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                  ),
                Transform.translate(
                  offset: Offset(0, 100 * controller.value),
                  child: child,
                ),
              ],
            );
          },
        );
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Klaim Hadiah Sekarang Juga!",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Semua survey dengan hadiah tertinggi minggu ini",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: false,
                viewportFraction: 1,
              ),
              items: filteredSurveys.map((path) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      path.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              }).toList(),
            ),
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
                          hintText: 'Cari survey..',
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
                        const Icon(Icons.search, color: Colors.black, size: 20),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kategori Teknologi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: filteredSurveyTekonologies.map((survey) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          survey.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(color: Colors.grey[300]),
                            );
                          },
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                    ),
                    // Deskripsi
                  ],
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kategori Kesehatan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: filteredSurveyKesehatan.map((survey) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          survey.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(color: Colors.grey[300]),
                            );
                          },
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                    ),
                    // Deskripsi
                  ],
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Semua Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              children: surveys.map((survey) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          survey.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(color: Colors.grey[300]),
                            );
                          },
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                    ),

                    // Deskripsi
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
