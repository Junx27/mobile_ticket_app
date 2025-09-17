import 'dart:io';

import 'package:mobile_ticket_app/domain/entities/follower/follower.dart';

abstract class FollowerRepository {
  Future<List<Follower>> getAllFollowers();
}
