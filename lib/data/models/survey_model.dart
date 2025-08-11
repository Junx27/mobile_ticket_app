class SurveyModel {
  final int id;
  final String name;
  final String image;
  final int price;
  final String description;
  final String category;

  SurveyModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      id: json['id'] ?? 0,
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'category': category,
    };
  }
}
