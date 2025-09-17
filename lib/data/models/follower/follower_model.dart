class FollowerModel {
  final int id;
  final String name;
  final String avatar;

  FollowerModel({required this.id, required this.name, required this.avatar});

  factory FollowerModel.fromJson(Map<String, dynamic> json) {
    return FollowerModel(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'avatar': avatar};
  }
}
