class ApiConstants {
  static const String baseUrl = 'http://100.75.148.91:8004';
  static const String usersEndpoint = '/api/users';

  static String get usersUrl => '$baseUrl$usersEndpoint';
  static const String createUserUrl = 'http://100.75.148.91:8000/user';
  static const String surveysUrl = 'http://100.75.148.91:8001/survey';
  static const String surveyCategoryUrl =
      'http://100.75.148.91:8001/categories';
}
