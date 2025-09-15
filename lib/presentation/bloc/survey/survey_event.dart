import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class SurveyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSurveysEvent extends SurveyEvent {
  final int? categoryId;
  final String? name;

  GetSurveysEvent({this.categoryId, this.name});
  @override
  List<Object?> get props => [categoryId, name];
}

class GetSurveyByIdEvent extends SurveyEvent {
  final int id;

  GetSurveyByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class CreateSurveyEvent extends SurveyEvent {
  final String name;
  final int price;
  final String description;
  final File imageFile; // ubah dari String ke File
  final int categoryId;

  CreateSurveyEvent({
    required this.name,
    required this.price,
    required this.description,
    required this.imageFile,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [name, price, description, imageFile, categoryId];
}
