import 'package:json_annotation/json_annotation.dart';

part 'candidates_model.g.dart';

@JsonSerializable()
/// Preferred to use jSONSerializable - Avoid to make common mistake during creation of model. File .g helps to string the model
/// It helps when object is larger and complex
/// Why used freezed - For a small scale of developer, it helps to develop faster and maintance well
class CandidatesModel {
  const CandidatesModel({
    required this.birthday,
    required this.id,
    required this.name,
    required this.expired,
    required this.gender,
    required this.photo,
  });

  factory CandidatesModel.fromJson(Map<String, dynamic> json) =>
      _$CandidatesModelFromJson(json);

  final int id;
  final String name;
  final String gender;
  final String photo;
  final int birthday;
  final int expired;

  Map<String, dynamic> toJson() => _$CandidatesModelToJson(this);
}
