part of 'candidate_blog_bloc.dart';

@freezed
class CandidateBlogEvent with _$CandidateBlogEvent {
  const factory CandidateBlogEvent.started() = _Started;
  const factory CandidateBlogEvent.fetchAllCandidates() =
      CandidateBlogFetchAllCandidates;
  const factory CandidateBlogEvent.updateSearch({
    required String value,
  }) = CandidateBlogUpdateSearch;
  const factory CandidateBlogEvent.fetchEmailStatusAddress() =
      CandidateBlogFetchEmailStatusAddress;
}
