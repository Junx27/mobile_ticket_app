import '../entities/survey_category.dart';

abstract class SurveyCategoryRepository {
  Future<List<SurveyCategory>> getAllSurveyCategories();
}
