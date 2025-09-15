import 'dart:io';
import '../entities/survey.dart';

abstract class SurveyRepository {
  Future<List<Survey>> getAllSurveys({int? categoryId, String? name});
  Future<Survey> getSurveyById(int id);

  Future<Survey> createSurvey({
    required String name,
    required int price, // ✅ konsisten dengan backend & datasource
    required String description,
    required File imageFile, // ✅ pakai File, bukan String
    required int categoryId,
  });
}
