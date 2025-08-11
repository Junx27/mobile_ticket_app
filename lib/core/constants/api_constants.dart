class ApiConstants {
  static const String baseUrl = 'http://localhost:8004';
  static const String usersEndpoint = '/api/users';

  static String get usersUrl => '$baseUrl$usersEndpoint';
  static const String createUserUrl = 'http://localhost:8000/user';
  static const String surveysUrl = 'http://localhost:8001/survey';
  static const String surveyCategoryUrl = 'http://localhost:8001/categories';
}
