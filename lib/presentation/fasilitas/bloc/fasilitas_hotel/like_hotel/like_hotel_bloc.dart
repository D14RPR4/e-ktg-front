import 'package:bloc/bloc.dart';
import 'package:e_ktg_mobile/data/datasources/fasilitas_hotel_remote_datasource.dart';
import 'package:e_ktg_mobile/data/model/responses/like/like_fasilitas_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_hotel_event.dart';
part 'like_hotel_state.dart';
part 'like_hotel_bloc.freezed.dart';

class LikeHotelBloc extends Bloc<LikeHotelEvent, LikeHotelState> {
  final FasilitasHotelRemoteDatasource fasilitasHotelRemoteDatasource;

  LikeHotelBloc(this.fasilitasHotelRemoteDatasource)
      : super(LikeHotelState.initial()) {
    on<LikeHotelEvent>((event, emit) async {
      await event.when(
        started: () async {},
        like: (postId) async {
          emit(const LikeHotelState.loading());

          final eitherResponse =
              await fasilitasHotelRemoteDatasource.likePost(postId);

          eitherResponse.fold(
            (failure) => emit(LikeHotelState.error(failure)),
            (success) => emit(LikeHotelState.success(success)),
          );
        },
      );
    });
  }
}
