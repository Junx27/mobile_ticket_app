import 'dart:io';

import 'package:mobile_ticket_app/data/sources/follower/follower_remote_data_source.dart';
import 'package:mobile_ticket_app/domain/entities/follower/follower.dart';
import 'package:mobile_ticket_app/domain/repositories/follower/follower_repository.dart';

class FollowerRepositoryImpl implements FollowerRepository {
  final FollowerRemoteDataSource remoteDataSource;

  FollowerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Follower>> getAllFollowers() async {
    try {
      final models = await remoteDataSource.getAllFollowers();

      return models
          .map((e) => Follower(id: e.id, name: e.name, avatar: e.avatar))
          .toList();
    } catch (e) {
      throw Exception('Failed to get all followers: $e');
    }
  }
}
