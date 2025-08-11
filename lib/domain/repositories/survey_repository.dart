import '../entities/survey.dart';

abstract class SurveyRepository {
  Future<List<Survey>> getAllSurveys({int? categoryId, String? name});
  Future<Survey> getSurveyById(int id);
}
