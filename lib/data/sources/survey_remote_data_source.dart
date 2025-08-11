import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../models/survey_model.dart';

abstract class SurveyRemoteDataSource {
  Future<List<SurveyModel>> getSurveys({int? categoryId, String? name});
  Future<SurveyModel> getSurveyById(int id);
}

class SurveyRemoteDataSourceImpl implements SurveyRemoteDataSource {
  final http.Client client;

  SurveyRemoteDataSourceImpl({http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<List<SurveyModel>> getSurveys({int? categoryId, String? name}) async {
    final queryParams = <String, String>{};
    if (categoryId != null) queryParams['category_id'] = categoryId.toString();
    if (name != null && name.isNotEmpty) queryParams['name'] = name;

    final uri = Uri.parse(ApiConstants.surveysUrl);
    final urlWithParams = Uri(
      scheme: uri.scheme,
      host: uri.host,
      port: uri.port,
      path: uri.path,
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );

    final response = await client.get(urlWithParams);

    print('[SurveyRemoteDataSource] GET $urlWithParams');
    print('[SurveyRemoteDataSource] Status Code: ${response.statusCode}');
    print('[SurveyRemoteDataSource] Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((json) => SurveyModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load surveys');
    }
  }

  @override
  Future<SurveyModel> getSurveyById(int id) async {
    final url = Uri.parse('${ApiConstants.surveysUrl}/$id');
    final response = await client.get(url);

    print('[SurveyRemoteDataSource] GET $url');
    print('[SurveyRemoteDataSource] Status Code: ${response.statusCode}');
    print('[SurveyRemoteDataSource] Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return SurveyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Survey not found');
    }
  }
}
