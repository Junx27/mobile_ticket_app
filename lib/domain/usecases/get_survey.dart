import '../entities/survey.dart';
import '../../domain/repositories/survey_repository.dart';

class GetSurveys {
  final SurveyRepository repository;

  GetSurveys(this.repository);

  Future<List<Survey>> call({int? categoryId, String? name}) async {
    return await repository.getAllSurveys(categoryId: categoryId, name: name);
  }
}
