import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<String> createUser(Map<String, dynamic> payload);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    final url = Uri.parse(ApiConstants.usersUrl);
    final response = await http.get(url);

    print('[UserRemoteDataSource] GET $url');
    print('[UserRemoteDataSource] Status Code: ${response.statusCode}');
    print('[UserRemoteDataSource] Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> jsonList = body['data'];
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users: ${response.body}');
    }
  }

  @override
  Future<String> createUser(Map<String, dynamic> payload) async {
    final url = Uri.parse(ApiConstants.createUserUrl);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    print('[UserRemoteDataSource] POST $url');
    print('[UserRemoteDataSource] Payload: $payload');
    print('[UserRemoteDataSource] Status Code: ${response.statusCode}');
    print('[UserRemoteDataSource] Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return 'User created successfully';
    } else {
      final Map<String, dynamic> errorBody = jsonDecode(response.body);
      final message = errorBody['message'] ?? 'Unknown error';
      throw Exception(message);
    }
  }
}
