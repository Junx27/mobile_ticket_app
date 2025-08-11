class SurveyCategoryModel {
  final int id;
  final String name;

  SurveyCategoryModel({required this.id, required this.name});

  factory SurveyCategoryModel.fromJson(Map<String, dynamic> json) {
    return SurveyCategoryModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
