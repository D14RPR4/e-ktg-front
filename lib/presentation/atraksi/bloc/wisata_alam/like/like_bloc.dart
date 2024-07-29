import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/wisata_alam_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/like/like_alam_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_event.dart';
part 'like_state.dart';
part 'like_bloc.freezed.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final WisataAlamRemoteDatasource wisataAlamRemoteDatasource;

  LikeBloc(this.wisataAlamRemoteDatasource) : super(const LikeState.initial()) {
    on<LikeEvent>((event, emit) async {
      await event.when(
        started: () async {
          // Initial event handling if needed
        },
        like: (postId) async {
          emit(const LikeState.loading());

          final eitherResponse =
              await wisataAlamRemoteDatasource.likePost(postId);

          eitherResponse.fold(
            (failure) => emit(LikeState.error(failure)),
            (success) => emit(LikeState.success(success)),
          );
        },
      );
    });
  }
}
