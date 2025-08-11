import '../../domain/entities/survey.dart';
import '../../domain/repositories/survey_repository.dart';
import '../../data/sources/survey_remote_data_source.dart';

class SurveyRepositoryImpl implements SurveyRepository {
  final SurveyRemoteDataSource remoteDataSource;

  SurveyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Survey>> getAllSurveys({int? categoryId, String? name}) async {
    try {
      final models = await remoteDataSource.getSurveys(
        categoryId: categoryId,
        name: name,
      );

      return models
          .map(
            (e) => Survey(
              id: e.id,
              name: e.name,
              image: e.image,
              price: e.price,
              description: e.description,
              category: e.category,
            ),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to get surveys: $e');
    }
  }

  @override
  Future<Survey> getSurveyById(int id) async {
    try {
      final e = await remoteDataSource.getSurveyById(id);
      return Survey(
        id: e.id,
        name: e.name,
        image: e.image,
        price: e.price,
        description: e.description,
        category: e.category,
      );
    } catch (e) {
      throw Exception('Survey not found: $e');
    }
  }
}
