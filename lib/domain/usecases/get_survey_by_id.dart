import '../entities/survey.dart';
import '../repositories/survey_repository.dart';

class GetSurveyById {
  final SurveyRepository repository;

  GetSurveyById(this.repository);

  Future<Survey> call(int id) async {
    return await repository.getSurveyById(id);
  }
}
