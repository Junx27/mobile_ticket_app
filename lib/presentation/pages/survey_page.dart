import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/survey.dart';
import '../../presentation/bloc/survey/survey_bloc.dart';
import '../../presentation/bloc/survey/survey_event.dart';
import '../../presentation/bloc/survey/survey_state.dart';
import '../../presentation/bloc/survey_category/survey_category_bloc.dart';
import '../../presentation/bloc/survey_category/survey_category_event.dart';
import '../../presentation/bloc/survey_category/survey_category_state.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      label: const Text(
                        'Kembali',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 4.0,
                  ),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari survey...',
                        hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      ),
                      onChanged: (value) {
                        context.read<SurveyBloc>().add(
                          GetSurveysEvent(name: value),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 4.0,
                  ),
                  child: BlocBuilder<SurveyCategoryBloc, SurveyCategoryState>(
                    builder: (context, state) {
                      if (state is SurveyCategoryLoaded) {
                        final surveys = state.surveyCategories;
                        final surveyState = context.watch<SurveyBloc>().state;

                        int? selectedId;

                        if (surveyState is SurveyLoaded) {
                          selectedId = surveyState.selectedCategoryId;
                          print('selectedId: $selectedId');
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRect(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                clipBehavior: Clip.hardEdge,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print('Clicked category: ALL');
                                        context.read<SurveyBloc>().add(
                                          GetSurveysEvent(),
                                        );
                                      },
                                      child: Container(
                                        width: 70,
                                        margin: const EdgeInsets.only(right: 8),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: selectedId == null
                                              ? Colors.blue
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                              blurRadius: 1,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'All',
                                            style: TextStyle(
                                              color: selectedId == null
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    ...surveys.map((survey) {
                                      final isSelected =
                                          selectedId == survey.id;
                                      return GestureDetector(
                                        onTap: () {
                                          print(
                                            'Clicked category id: ${survey.id}',
                                          );
                                          context.read<SurveyBloc>().add(
                                            GetSurveysEvent(
                                              categoryId: survey.id,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 70,
                                          margin: const EdgeInsets.only(
                                            top: 8,
                                            right: 8,
                                            bottom: 8,
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.1,
                                                ),
                                                blurRadius: 1,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              survey.name,
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),

            Expanded(
              child: BlocBuilder<SurveyBloc, SurveyState>(
                builder: (context, state) {
                  if (state is SurveyLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SurveyLoaded) {
                    return GridViewWidget(surveys: state.surveys);
                  } else if (state is SurveyError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('No data'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewWidget extends StatefulWidget {
  final List<Survey> surveys;

  const GridViewWidget({super.key, required this.surveys});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  final ScrollController _scrollController = ScrollController();
  double _topPadding = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && _topPadding != 0) {
        setState(() {
          _topPadding = 0;
        });
      } else if (_scrollController.offset <= 0 && _topPadding != 0.0) {
        setState(() {
          _topPadding = 0.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
        top: _topPadding,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          context.read<SurveyBloc>().add(GetSurveysEvent());
        },
        child: GridView.builder(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: widget.surveys.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final survey = widget.surveys[index];
            final formattedPrice = NumberFormat(
              '#,###',
              'id_ID',
            ).format(survey.price).replaceAll(',', '.');

            return InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(5),
                      ),
                      child: Image.network(
                        survey.image,
                        height: 175,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const SizedBox(
                          height: 120,
                          child: Center(child: Icon(Icons.broken_image)),
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            height: 120,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    ),
                    const Gap(6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Transform.rotate(
                                angle: -45,
                                child: Icon(
                                  Icons.new_label,
                                  color: getCategoryColor(survey.category),
                                  size: 12,
                                ),
                              ),
                              const Gap(2),
                              Text(
                                survey.category,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: getCategoryColor(survey.category),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Text("."),
                              ),
                              Text(
                                "Terlaris",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: getCategoryColor(survey.category),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  survey.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Gap(2),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.price_change_rounded,
                                    color: Colors.blue,
                                    size: 12,
                                  ),
                                  const Gap(2),
                                  Text(
                                    formattedPrice,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(2),
                          Row(
                            children:
                                List.generate(
                                  5,
                                  (_) => const Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                    size: 12,
                                  ),
                                )..add(
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      "-55% OFF",
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.red,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                          ),
                          const Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  survey.description,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black54,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(
                                Icons.download,
                                color: Colors.blue,
                                size: 12,
                              ),
                            ],
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
      ),
    );
  }
}

Color getCategoryColor(String category) {
  switch (category.toLowerCase()) {
    case 'kesehatan':
      return Colors.red;
    case 'teknologi':
      return Colors.green;
    case 'kuliner':
      return Colors.purpleAccent;
    default:
      return Colors.blue;
  }
}
