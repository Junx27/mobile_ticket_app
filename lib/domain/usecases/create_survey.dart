import 'dart:io';
import '../entities/survey.dart';
import '../repositories/survey_repository.dart';

class CreateSurvey {
  final SurveyRepository repository;

  CreateSurvey(this.repository);

  Future<Survey> call({
    required String name,
    required int price, // ✅ pakai int
    required String description,
    required File imageFile, // ✅ pakai File
    required int categoryId,
  }) async {
    return await repository.createSurvey(
      name: name,
      price: price,
      description: description,
      imageFile: imageFile,
      categoryId: categoryId,
    );
  }
}
