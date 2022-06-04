part of 'candidate_blog_bloc.dart';

@freezed
class CandidateBlogState with _$CandidateBlogState {
  const factory CandidateBlogState.initial() = _Initial;
  const factory CandidateBlogState.success({
    required List<CandidatesModel> candidatesModel,
    required List<Blog> blogModel,
    required List<Address> addressModel,
    required List<EmailModel> emailModel,
    required List<Status> statusModel,
    CandidatesModel? matchCandidate,
    Blog? matchBlog,
  }) = CandidateBlogSuccess;
  const factory CandidateBlogState.loading({required bool isLoading}) =
      CandidateBlogLoading;
  const factory CandidateBlogState.error({required String errorMessage}) =
      CandidateBlogError;
}
