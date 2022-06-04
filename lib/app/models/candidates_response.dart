import 'package:json_annotation/json_annotation.dart';
import 'package:mau_kerja_assessment/app/models/candidates_model.dart';


part 'candidates_response.g.dart';

@JsonSerializable()
class CandidatesResponse {
  const CandidatesResponse({
    required this.results,
    this.message,
  });

  factory CandidatesResponse.fromJson(Map<String, dynamic> json) =>
      _$CandidatesResponseFromJson(json);

  final dynamic message;
  final List<CandidatesModel> results;

  Map<String, dynamic> toJson() => _$CandidatesResponseToJson(this);
}
