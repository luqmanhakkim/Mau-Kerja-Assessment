// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidatesResponse _$CandidatesResponseFromJson(Map<String, dynamic> json) =>
    CandidatesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => CandidatesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'],
    );

Map<String, dynamic> _$CandidatesResponseToJson(CandidatesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'results': instance.results,
    };
