import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mau_kerja_assessment/app/models/models.dart';
import 'package:mau_kerja_assessment/app/repository/candidate_blog_repository.dart';
part 'candidate_blog_event.dart';
part 'candidate_blog_state.dart';
part 'candidate_blog_bloc.freezed.dart';

class CandidateBlogBloc extends Bloc<CandidateBlogEvent, CandidateBlogState> {
  CandidateBlogBloc(this.candidateBlogRepository) : super(const _Initial()) {
    on<CandidateBlogEvent>(_onEvent);
  }

  final CandidateBlogRepository candidateBlogRepository;

  Future<void> _onEvent(
    CandidateBlogEvent event,
    Emitter<CandidateBlogState> emit,
  ) async {
    if (event is CandidateBlogFetchAllCandidates) {
      emit(const CandidateBlogLoading(isLoading: true));
      try {
        final response = await candidateBlogRepository.getCandidates();
        final blogResponse = await candidateBlogRepository.getBlog();

        emit(const CandidateBlogLoading(isLoading: false));

        emit(
          CandidateBlogSuccess(
            candidatesModel: response.results,
            blogModel: blogResponse.results!,
            emailModel: [],
            addressModel: [],
            statusModel: [],
          ),
        );
      } on DioError catch (e) {
        emit(const CandidateBlogLoading(isLoading: false));

        emit(CandidateBlogError(errorMessage: e.message));
      }
    }

    if (event is CandidateBlogUpdateSearch) {
      final _state = state as CandidateBlogSuccess;
      if (event.value.isEmpty) {
        emit(
          _state.copyWith(
            matchCandidate: null,
            matchBlog: null,
          ),
        );
        return;
      }

      for (final candidate in _state.candidatesModel) {
        if (candidate.name.toLowerCase().contains(event.value)) {
          emit(
            _state.copyWith(
              matchCandidate: candidate,
            ),
          );
          return;
        }
      }

      for (final blog in _state.blogModel) {
        if (blog.title!.toLowerCase().contains(event.value)) {
          emit(
            _state.copyWith(
              matchBlog: blog,
            ),
          );
          return;
        }
      }
    }

    if (event is CandidateBlogFetchEmailStatusAddress) {
      final _state = state as CandidateBlogSuccess;

      emit(const CandidateBlogLoading(isLoading: true));

      try {
        final emailResponse = await candidateBlogRepository.getEmail();

        final addressResponse = await candidateBlogRepository.getAddress();

        final statusResponse = await candidateBlogRepository.getStatus();

        emit(const CandidateBlogLoading(isLoading: false));

        print('emailResponse ${emailResponse.results}');

        emit(_state.copyWith(
          emailModel: emailResponse.results!,
          addressModel: addressResponse.results!,
          statusModel: statusResponse.results!,
        ));
      } on DioError catch (e) {
        emit(const CandidateBlogLoading(isLoading: false));

        emit(CandidateBlogError(errorMessage: e.message));
      }
    }
  }
}
