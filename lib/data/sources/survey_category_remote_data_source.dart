import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../models/survey_category_model.dart';

abstract class SurveyCategoryRemoteDataSource {
  Future<List<SurveyCategoryModel>> getSurveyCategories();
}

class SurveyCategoryRemoteDataSourceImpl
    implements SurveyCategoryRemoteDataSource {
  final http.Client client;

  SurveyCategoryRemoteDataSourceImpl({http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<List<SurveyCategoryModel>> getSurveyCategories() async {
    final url = Uri.parse(ApiConstants.surveyCategoryUrl);
    final response = await client.get(url);

    print('[SurveyRemoteDataSource] GET $url');
    print('[SurveyRemoteDataSource] Status Code: ${response.statusCode}');
    print('[SurveyRemoteDataSource] Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => SurveyCategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load surveys');
    }
  }
}
