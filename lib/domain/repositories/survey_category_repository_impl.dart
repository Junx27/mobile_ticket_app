import '../../domain/entities/survey_category.dart';
import '../../domain/repositories/survey_category_repository.dart';
import '../../data/sources/survey_category_remote_data_source.dart';

class SurveyCategoryRepositoryImpl implements SurveyCategoryRepository {
  final SurveyCategoryRemoteDataSource remoteDataSource;

  SurveyCategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SurveyCategory>> getAllSurveyCategories() async {
    try {
      final models = await remoteDataSource.getSurveyCategories();
      return models.map((e) => SurveyCategory(id: e.id, name: e.name)).toList();
    } catch (e) {
      throw Exception('Failed to get survey categories: $e');
    }
  }
}
