import '../entities/survey_category.dart';
import '../../domain/repositories/survey_category_repository.dart';

class GetSurveyCategories {
  final SurveyCategoryRepository repository;

  GetSurveyCategories(this.repository);

  Future<List<SurveyCategory>> call() async {
    return await repository.getAllSurveyCategories();
  }
}
