// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidatesModel _$CandidatesModelFromJson(Map<String, dynamic> json) =>
    CandidatesModel(
      birthday: json['birthday'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      expired: json['expired'] as int,
      gender: json['gender'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$CandidatesModelToJson(CandidatesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'photo': instance.photo,
      'birthday': instance.birthday,
      'expired': instance.expired,
    };
