import 'package:bloc/bloc.dart';

import 'package:e_ktg_mobile/data/datasources/fasilitas_hotel_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/request/comment/comment_fasilitas_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/model/responses/comment/comment_fasilitas_response_model.dart';

part 'post_comment_hotel_event.dart';
part 'post_comment_hotel_state.dart';
part 'post_comment_hotel_bloc.freezed.dart';

class PostCommentHotelBloc
    extends Bloc<PostCommentHotelEvent, PostCommentHotelState> {
  PostCommentHotelBloc() : super(_Initial()) {
    on<PostCommentHotelEvent>((event, emit) async {
      await event.when(
        started: () async {
          // Initial event handling if needed
          // emit(some initial state if needed);
        },
        postCommentHotel: (data, postId) async {
          emit(const _Loading());
          final eitherResponse = await FasilitasHotelRemoteDatasource()
              .postCommentHotel(data, postId); // corrected event.data to data
          eitherResponse.fold(
            (failure) => emit(_Error(failure)),
            (response) => emit(_Success(response)),
          );
        },
      );
    });
  }
}
