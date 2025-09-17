import 'package:http/http.dart' as http;
import 'package:mobile_ticket_app/data/models/follower/follower_model.dart';

abstract class FollowerRemoteDataSource {
  Future<List<FollowerModel>> getAllFollowers();
}

class FollowerRemoteDataSourceImpl implements FollowerRemoteDataSource {
  final http.Client client;

  FollowerRemoteDataSourceImpl({http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<List<FollowerModel>> getAllFollowers() async {
    final List<Map<String, dynamic>> followers = [
      {
        'id': 1,
        'name': 'junx',
        'avatar':
            'https://static.vecteezy.com/system/resources/previews/005/419/157/non_2x/female-user-profile-avatar-is-a-woman-a-character-for-a-screen-saver-with-emotions-illustration-on-a-white-isolated-background-vector.jpg',
      },
      {
        'id': 2,
        'name': 'senna',
        'avatar':
            'https://static.vecteezy.com/system/resources/previews/014/212/681/non_2x/female-user-profile-avatar-is-a-woman-a-character-for-a-screen-saver-with-emotions-for-website-and-mobile-app-design-illustration-on-a-white-isolated-background-vector.jpg',
      },
      {
        'id': 3,
        'name': 'dinda',
        'avatar':
            'https://static.vecteezy.com/system/resources/previews/005/017/777/non_2x/female-user-profile-avatar-is-a-woman-a-character-for-a-screen-saver-with-emotions-illustration-on-a-white-isolated-background-vector.jpg',
      },
    ];

    return followers.map((json) => FollowerModel.fromJson(json)).toList();
  }
}
