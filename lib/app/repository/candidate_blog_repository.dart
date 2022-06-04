import 'package:dio/dio.dart';
import 'package:mau_kerja_assessment/app/models/address_model.dart';
import 'package:mau_kerja_assessment/app/models/blog_model.dart';
import 'package:mau_kerja_assessment/app/models/candidates_response.dart';
import 'package:mau_kerja_assessment/app/models/emails_model.dart';
import 'package:mau_kerja_assessment/app/models/models.dart';

import '../../networking/networking.dart';

class CandidateBlogRepository {
  Future<CandidatesResponse> getCandidates() async {
    try {
      final dynamic response = await ApiUtil().baseCall(
        method: 'get',
        url: '/candidates',
      );

      final map = response as Map<String, dynamic>;

      return CandidatesResponse.fromJson(map);
    } on DioError {
      rethrow;
    }
  }

  Future<BlogModel> getBlog() async {
    try {
      final dynamic response = await ApiUtil().baseCall(
        method: 'get',
        url: '/blogs',
      );

      final map = response as Map<String, dynamic>;

      return BlogModel.fromJson(map);
    } on DioError {
      rethrow;
    }
  }

  Future<Email> getEmail() async {
    try {
      final dynamic response = await ApiUtil().baseCall(
        method: 'get',
        url: '/emails',
      );

      final map = response as Map<String, dynamic>;

      return Email.fromJson(map);
    } on DioError {
      rethrow;
    }
  }

    Future<AddressModel> getAddress() async {
    try {
      final dynamic response = await ApiUtil().baseCall(
        method: 'get',
        url: '/address',
      );

      final map = response as Map<String, dynamic>;

      return AddressModel.fromJson(map);
    } on DioError {
      rethrow;
    }
  }

  Future<StatusModel> getStatus() async {
    try {
      final dynamic response = await ApiUtil().baseCall(
        method: 'get',
        url: '/experiences',
      );

      final map = response as Map<String, dynamic>;

      return StatusModel.fromJson(map);
    } on DioError {
      rethrow;
    }
  }
}
